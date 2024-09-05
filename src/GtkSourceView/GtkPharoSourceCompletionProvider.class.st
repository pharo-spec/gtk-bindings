"
This is a completion provider for Pharo Source.
It implements a GtkSourceCompletionProviderIface (see gDefine: and gDefineCompletionProviderInterface: interface)
It uses CompletionContext to provide useful completions in editors.

https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/iface.CompletionProvider.html
"
Class {
	#name : 'GtkPharoSourceCompletionProvider',
	#superclass : 'GObject',
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
	#category : 'GtkSourceView-Completion-Pharo',
	#package : 'GtkSourceView',
	#tag : 'Completion-Pharo'
}

{ #category : 'private' }
GtkPharoSourceCompletionProvider class >> defaultCompletionEngine [
	"A simple completion engine that provides a scripting completion engine (to be 
	 used if no completion engine is provided)"
	
	^ GtkCodeCompletionEngine new 
		scripting: true;
		doItRequestor: nil;
		doItContext: nil;
		completionClass: UndefinedObject;
		yourself
]

{ #category : 'class initialization' }
GtkPharoSourceCompletionProvider class >> gClass [

	^ GClass gClassAt: self
]

{ #category : 'class initialization' }
GtkPharoSourceCompletionProvider class >> gDefine: gClass [

	gClass
		addInterface: GtkSourceCompletionProviderIface 
		initialize: [ :interface | self gDefineCompletionProviderInterface: interface ]
]

{ #category : 'class initialization' }
GtkPharoSourceCompletionProvider class >> gDefineCompletionProviderInterface: interface [

	interface
		connect: #get_title 
			signature: #(void* (void *provider)) 
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
					callback: callback
					data: user_data ];	
		connect: #populate_finish
			signature: #(void *(void *provider, void *result, void *error))
			to: [ :provider :result :error | 
				(self gInstance: provider) 
					populateFinish: result error: error ] ;	
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
					activate: (GtkSourceCompletionContext fromHandleUnreferenced: context) 
					proposal: proposal ];	
		connect: #list_alternates 
			signature: #(void *(void *provider, void *context, void *proposal)) 
			to: [ :provider :context :proposal |
				(self gInstance: provider) 
					list_alternates: context 
					proposal: proposal ]
]

{ #category : 'class initialization' }
GtkPharoSourceCompletionProvider class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : 'instance creation' }
GtkPharoSourceCompletionProvider class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : 'private' }
GtkPharoSourceCompletionProvider class >> separators [

	^ Separators ifNil: [ Separators := Character separators, Character specialCharacters ]
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> activate: context proposal: proposalHandle [
	| proposal word |
	
	proposal := lastResults itemByHandle: proposalHandle ifNone: [ nil ].
	proposal ifNil: [ ^ self ].

	word := proposal typedText asString.
	context withBoundsDo: [ :begin :end |
		self insertWord: word begin: begin end: end ]
]

{ #category : 'private - populate' }
GtkPharoSourceCompletionProvider >> appendResultsTo: stream for: word in: aString position: aPosition [
				
	(self completionEntriesFor: word in: aString position: aPosition) 
		collect: [ :each | GtkPharoSourceCompletionProposal newEntry: each ]
		thenDo: [ :each | stream nextPut: each ]
]

{ #category : 'private' }
GtkPharoSourceCompletionProvider >> clearLastResults [
	
	(lastResults isNil 
		or: [ lastResults getHandle isNull
		or: [ lastResults items isEmpty ] ])
		ifTrue: [ ^ self ].

	lastResults objectUnref.
	lastResults getHandle beNull
]

{ #category : 'accessing' }
GtkPharoSourceCompletionProvider >> completionEngine [

	^ completionEngine ifNil: [ completionEngine := self class defaultCompletionEngine ]
]

{ #category : 'accessing' }
GtkPharoSourceCompletionProvider >> completionEngine: aCompletionEngine [

	completionEngine := aCompletionEngine
]

{ #category : 'private - populate' }
GtkPharoSourceCompletionProvider >> completionEntriesFor: word in: aString position: aPosition [
	| completionContext |

	(word isNil or: [ word size < 2 ]) ifTrue: [ ^ #() ].

	completionContext := GtkCompletionContext
		engine: self completionEngine
		class: self completionEngine completionClass
		source: aString
		position: aPosition.
	completionContext narrowWith: word.

	^ completionContext entries
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> display: context proposal: proposalHandle cell: cellHandle [
	| cell |

	cell := GtkSourceCompletionCell fromHandleUnreferenced: cellHandle.
	(cell column = GTK_SOURCE_COMPLETION_COLUMN_TYPED_TEXT) ifTrue: [ 
		cell text: (lastResults 
			itemByHandle: proposalHandle
			ifFound: [ :aProposal | aProposal typedText ]
			ifNone: [ 'Unknown' ]).
		^ self	 ].
	"(cell column = GTK_SOURCE_COMPLETION_COLUMN_ICON) ifTrue: [  
		cell iconName: 'completion-word-symbolic'.
		^ self ]."
		
	cell text: nil
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> get_priority: context [

	^ 1
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> get_title [

	^ ExternalAddress null  "GLibLibrary uniqueInstance gstrdup: 'Pharo'"
]

{ #category : 'private' }
GtkPharoSourceCompletionProvider >> insertWord: word begin: begin end: end [
	| textBuffer endWord endMark |
	
	endMark := nil.
	textBuffer := begin buffer.

	textBuffer userActionDuring: [
		(end endsLine not 
			and: [ end char isSeparator not 
			and: [ end endsWord not ] ])
			ifTrue: [
				| text |
				endWord := end copyInMemory.
				endWord forwardWordEnd ifTrue: [ 
					text := end sliceTo: endWord.
					(word endsWith: text) ifTrue: [
						endMark := textBuffer 
							createMarkNamed: nil 
							where: end 
							leftGravity: false ] ] ].
		
			textBuffer   
				deleteStart: begin end: end;
				insertIter: begin text: word.
			
		endMark ifNotNil: [ 
			| pos |
			pos := textBuffer iterAtMark: endMark.
			textBuffer selectRangeInsert: pos bound: pos.
			textBuffer deleteMark: endMark ] ]
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> is_trigger: iter character: ch [

	^ false
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> key_activates: context proposal: proposal keyval: keyval [

	^ false
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> list_alternates: context proposal: proposal [

	^ ExternalAddress null
]

{ #category : 'private - populate' }
GtkPharoSourceCompletionProvider >> newResultsFor: word in: aString position: aPosition [
	
	^ GListStore
		newType: GtkPharoSourceCompletionProposal 
		streamContents: [ :stream |
			self 
				appendResultsTo: stream 
				for: word 
				in: aString 
				position: aPosition ]
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> populate: context [

	self error: 'should not arrive here'. 
	^ ExternalAddress null
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> populateAsync: context cancellable: cancellable callback: callback data: data [
	| task word text position |

	word := context word.
	text := context buffer text.
	position := context buffer cursorPosition.

	task := GTask 
		newSource: self
		cancellableHandle: cancellable
		readyCallbackHandle: callback 
		data: data.

	lastResults := self newResultsFor: word in: text position: position.
	"returning the pointer will trigger an immediate call to the 
	 callback providing the result."
	task 
		returnPointer: lastResults getHandle
		destroyNotify: (ExternalAddress 
			loadSymbol: #g_object_unref 
			from: GObjectLibrary).
		
	task objectUnrefNow
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> populateFinish: result error: error [

	"this will take ownership, hence it needs to be referenced (otherwise, it will crash)"
	^ (GTask fromHandleUnreferenced: result) propagatePointer: error
]

{ #category : 'accessing - model' }
GtkPharoSourceCompletionProvider >> refilter: context model: modelHandle [ 
	| word text position |

	lastResults getHandle = modelHandle ifFalse: [ 
		'ERROR' printToStdout.
		^ self ].

	word := context word.
	text := context buffer text.
	position := context buffer cursorPosition.

	lastResults removeAll.
	self 
		appendResultsTo: lastResults 
		for: word 
		in: text
		position: position.

	context 
		proposalsForProvider: self 
		results: lastResults 
]
