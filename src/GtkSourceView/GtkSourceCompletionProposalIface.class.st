"
https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/iface.CompletionProposal.html
"
Class {
	#name : #GtkSourceCompletionProposalIface,
	#superclass : #GInterface,
	#instVars : [
		'get_typed_text'
	],
	#classVars : [
		'OFFSET_GET_TYPED_TEXT'
	],
	#category : #'GtkSourceView-Completion'
}

{ #category : #'field definition' }
GtkSourceCompletionProposalIface class >> fieldsDesc [
	"super rebuildFieldAccessors"
	
	^ super fieldsDesc, #(
	GCallback get_typed_text
)
]

{ #category : #accessing }
GtkSourceCompletionProposalIface class >> gType [ 
	"This method was automatically generated"

	^ self 
		ffiCall: #(gsize gtk_source_completion_proposal_get_type())
		module: GtkSourceViewLibrary
]

{ #category : #private }
GtkSourceCompletionProposalIface class >> rebuildFieldAccessors [

]

{ #category : #'accessing - structure variables' }
GtkSourceCompletionProposalIface >> get_typed_text [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_TYPED_TEXT) asInteger)
]

{ #category : #'accessing - structure variables' }
GtkSourceCompletionProposalIface >> get_typed_text: aCallback [
	"This method was automatically generated"
	
	get_typed_text := aCallback.
	handle 
		pointerAt: OFFSET_GET_TYPED_TEXT
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
