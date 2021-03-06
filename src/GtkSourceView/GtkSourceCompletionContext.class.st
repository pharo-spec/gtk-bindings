"
GtkSourceCompletionContext — The context of a completion

https://developer.gnome.org/gtksourceview/stable/GtkSourceCompletionContext.html
"
Class {
	#name : #GtkSourceCompletionContext,
	#superclass : #GObject,
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#category : #'GtkSourceView-Completion'
}

{ #category : #accessing }
GtkSourceCompletionContext >> addProposals: proposals provider: provider finished: finished [

	self ffiCall: #(void gtk_source_completion_context_add_proposals (
		self,
		"GtkSourceCompletionProvider *"GObject *provider,
 		GList *proposals,
 		gboolean finished))
]

{ #category : #'library path' }
GtkSourceCompletionContext >> ffiLibraryName [

	^ GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceCompletionContext >> getIter: iter [
	"Some times is needed to access directly this (otherwise it should be private).
	 See senders to check it."
	
	^ self ffiCall: #(gboolean gtk_source_completion_context_get_iter(
		self,
 		GtkTextIter *iter))
]

{ #category : #accessing }
GtkSourceCompletionContext >> iter [
	| iter |
	
	iter := GtkTextIter new.
	^ (self getIter: iter) 
		ifTrue: [ iter ]
		ifFalse: [ nil ]
]
