"
This is a completion provider for Pharo Source.
It implements a GtkSourceCompletionProviderIface (see gDefine: and gDefineCompletionProviderInterface: interface)
It uses CompletionContext to provide useful completions in editors.

https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/iface.CompletionProvider.html
"
Class {
	#name : #GtkPharoSourceCompletionProvider,
	#superclass : #GObject,
	#traits : 'GtkSourceViewTLibrary + GTClass',
	#classTraits : 'GtkSourceViewTLibrary classTrait + GTClass classTrait',
	#instVars : [
		'completionEngine',
		'iconsCache',
		'lastResults'
	],
	#classVars : [
		'Separators'
	],
	#pools : [
		'GtkSourceCompletionActivation',
		'GtkSourceCompletionColumn'
	],
	#category : #'GtkSourceView-Completion-Pharo'
}

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gClass [

	^ GClass gClassAt: self
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gDefine: gClass [

	gClass
		addInterface: GtkSourceCompletionProviderIface 
		initialize: [ :interface | self gDefineCompletionProviderInterface: interface ]
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gDefineCompletionProviderInterface: interface [

	interface
		connect: #get_title 
			signature: #(char* (void *provider)) 
			to: [ :provider | 
				(self gInstance: provider) get_title ];
		connect: #get_priority
			signature: #(int (void *provider, void *context))
			to: [ :provider :context | 
				(self gInstance: provider) get_priority: context ];
		connect: #is_trigger 
			signature: #(gboolean (void *provider, void *iter, gunichar ch)) 
			to: [ :provider :iter :ch | 
				(self gInstance: provider) is_trigger: iter character: ch ];	
		connect: #key_activates 
			signature: #(gboolean (void *provider, void *context, void *proposal, guint keyval)) 
			to: [ :provider :context :proposal :keyval | 
				(self gInstance: provider) 
					key_activates: context 
					proposal: proposal 
					keyval: keyval ];	
		connect: #populate
			signature: #(void *(void *provider, void *context, void *error))
			to: [ :provider :context :error | 
				(self gInstance: provider) populate: context ];	
		connect: #populate_async 
			signature: #(void (void *provider, void *context, void *cancellable, void *callback, gpointer user_data))
			to: [ :provider :context :cancellable :callback :user_data | 
				(self gInstance: provider) 
					populateAsync: (GtkSourceCompletionContext fromHandleUnreferenced: context)
					cancellable: cancellable
					callback: callback ];	
		connect: #populate_finish
			signature: #(void *(void *provider, void *result, void *error))
			to: [ :provider :result :error | 
				(self gInstance: provider) 
					populateFinish: result ] ;	
		connect: #refilter
			signature: #(void (void *provider, void *context, void *model))
			to: [ :provider :context :model | 
				(self gInstance: provider) 
					refilter: (GtkSourceCompletionContext fromHandleUnreferenced: context) 
					model: model ];	
		connect: #display
			signature: #(void (void *provider, void *context, void *proposal, void *cell))
			to: [ :provider :context :proposal :cell | 
				(self gInstance: provider) 
					display: (GtkSourceCompletionContext fromHandleUnreferenced: context) 
					proposal: proposal 
					cell: cell ];	
		connect: #activate
			signature: #(void (void *provider, void *context, void *proposal))
			to: [ :provider :context :proposal | 
				(self gInstance: provider) 
					activate: context 
					proposal: proposal ];	
		connect: #list_alternates 
			signature: #(void *(void *provider, void *context, void *proposal)) 
			to: [ :provider :context :proposal |
				(self gInstance: provider) 
					list_alternates: context 
					proposal: proposal ]
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProvider class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #'instance creation' }
GtkPharoSourceCompletionProvider class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #private }
GtkPharoSourceCompletionProvider class >> separators [

	^ Separators ifNil: [ Separators := Character separators, Character specialCharacters ]
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> activate: context proposal: proposalHandle [
	| proposal |
	
	proposal := lastResults itemByHandle: proposalHandle ifNone: [ nil ].
	proposal ifNil: [ ^ self ].

	proposal typedText printToStdout
]

{ #category : #TOREMOVE }
GtkPharoSourceCompletionProvider >> cleanWord: aString [
	"remove cascade and end of sentence"

	^ aString reject: [ :each | #(; .) includes: each  ]
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> completionEngine [
	^ completionEngine
]

{ #category : #accessing }
GtkPharoSourceCompletionProvider >> completionEngine: anObject [
	completionEngine := anObject
]

{ #category : #TOREMOVE }
GtkPharoSourceCompletionProvider >> completionEntriesFor: iter [
	| completionContext word textBuffer |

	textBuffer := iter buffer.
	word := self currentWord: iter in: textBuffer.
	word ifNil: [ ^ #() ].

	completionContext := GtkCompletionContext
		engine: self completionEngine
		class: self completionEngine completionClass
		source: textBuffer text
		position: iter offset.
	completionContext narrowWith: word.

	^ completionContext entries
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> completionEntriesFor: word in: textBuffer [
	| completionContext |

	word ifNil: [ ^ #() ].

	completionContext := GtkCompletionContext
		engine: self completionEngine
		class: self completionEngine completionClass
		source: textBuffer text
		position: textBuffer cursorPosition.
	completionContext narrowWith: word.

	^ completionContext entries
]

{ #category : #TOREMOVE }
GtkPharoSourceCompletionProvider >> currentWord: iter in: textBuffer [
	| start line |
		
	start := iter copyInMemory lineOffset: 0.
	line := textBuffer 
		textStart: start 
		end: iter
		includeHiddenChars: false.
	line ifNil: [ ^ nil ].
	
	(line isEmpty 
		or: [ self class separators includes: line last ]) 
		ifTrue: [ ^ nil ].
	
	^ self cleanWord: line substrings last
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> display: context proposal: proposalHandle cell: cellHandle [
	| cell |
	
	cell := GtkSourceCompletionCell fromHandleUnreferenced: cellHandle.
	(cell column = GTK_SOURCE_COMPLETION_COLUMN_TYPED_TEXT) ifTrue: [ 
		cell text: (lastResults 
			itemByHandle: proposalHandle
			ifFound: [ :aProposal | aProposal typedText ]
			ifNone: [ 'Unknown' ]).
		^ self	 ].
		
	cell text: nil
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> get_priority: context [

	^ 1
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> get_title [

	^ 'Pharo'
]

{ #category : #TOREMOVE }
GtkPharoSourceCompletionProvider >> iconAt: icon ifAbsentPut: aBlock [ 

	iconsCache ifNil: [ iconsCache := IdentityDictionary new ].
	^ iconsCache 
		at: icon 
		ifAbsentPut: aBlock
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> is_trigger: iter character: ch [

	^ false
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> key_activates: context proposal: proposal keyval: keyval [

	^ false
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> list_alternates: context proposal: proposal [

	'ALTERNATES' printToStdout.
	^ ExternalAddress null
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> populate: context [

	'POPULATE' printToStdout.
	^ lastResults getHandle
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> populateAsync: context cancellable: cancellable callback: callback [
	| word |
	
	word := context word.
	[  
		5 milliSeconds wait.
		GRunLoop defer: [ 
			context 
				proposalsForProvider: self 
				results: self results ] 
	] fork
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> populateFinish: result [

	'FINISH' printToStdout.
	^ lastResults getHandle
]

{ #category : #'accessing - model' }
GtkPharoSourceCompletionProvider >> refilter: context model: model [

	'Refilter' printToStdout.
	context word printToStdout
]

{ #category : #private }
GtkPharoSourceCompletionProvider >> results [

	"keep last restults served"
	^ lastResults := GRunLoop defer: [
			(GListObjectStore newType: GtkPharoSourceCompletionProposal gType) 
				items: (Smalltalk allClassesAndTraits 
					select: [ :each | each name beginsWith: 'Ob' ]
					thenCollect: [ :each | 
						(GtkPharoSourceCompletionProposal newTypedText: each name)
							objectRef;
							yourself ]);
				objectRef;
				yourself ]
]

{ #category : #TOREMOVE }
GtkPharoSourceCompletionProvider >> toItem: aCompletionEntry [
	| item |

	item := GtkSourceCompletionItem newLabel: aCompletionEntry contents.
	aCompletionEntry icon ifNotNil: [ :icon |
		item icon: (self 
			iconAt: icon
			ifAbsentPut: [ GdkPixbuf newForm: icon ]) ].
	^ item
]
