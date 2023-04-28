"
https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/iface.CompletionProposal.html
"
Class {
	#name : #GtkPharoSourceCompletionProposal,
	#superclass : #GObject,
	#traits : 'GtkSourceViewTLibrary + GTClass',
	#classTraits : 'GtkSourceViewTLibrary classTrait + GTClass classTrait',
	#instVars : [
		'entry'
	],
	#category : #'GtkSourceView-Completion-Pharo'
}

{ #category : #'class initialization' }
GtkPharoSourceCompletionProposal class >> gDefine: gClass [

	gClass 
		parent: GObject;
		addInterface: GtkSourceCompletionProposalIface 
			initialize: [ :interface | self gDefineCompletionProposalInterface: interface ]
]

{ #category : #'class initialization' }
GtkPharoSourceCompletionProposal class >> gDefineCompletionProposalInterface: interface [

	interface 
		connect: #get_typed_text
		signature: #(char *(void *proposal))
		to: [ :proposal | (self gInstance: proposal) get_typed_text ]
]

{ #category : #'instance creation' }
GtkPharoSourceCompletionProposal class >> newEntry: anEntry [

	^ self new
		entry: anEntry;
		yourself
]

{ #category : #accessing }
GtkPharoSourceCompletionProposal >> entry [

	^ entry
]

{ #category : #private }
GtkPharoSourceCompletionProposal >> entry: anEntry [
	
	entry := anEntry
]

{ #category : #'accessing - structure variables' }
GtkPharoSourceCompletionProposal >> get_typed_text [

	^ self typedText
]

{ #category : #accessing }
GtkPharoSourceCompletionProposal >> typedText [

	^ self entry contents asString
]
