"
GtkSourceCompletionContext — The context of a completion

https://developer.gnome.org/gtksourceview/stable/GtkSourceCompletionContext.html
"
Class {
	#name : 'GtkSourceCompletionContext',
	#superclass : 'GObject',
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#instVars : [
		'buffer',
		'completion'
	],
	#category : 'GtkSourceView-Completion',
	#package : 'GtkSourceView',
	#tag : 'Completion'
}

{ #category : 'accessing' }
GtkSourceCompletionContext >> activation [

	^ self ffiCall: #(GtkSourceCompletionActivation gtk_source_completion_context_get_activation (self))
]

{ #category : 'accessing' }
GtkSourceCompletionContext >> buffer [ 

	^ buffer ifNil: [ buffer := self getBuffer ]
]

{ #category : 'accessing' }
GtkSourceCompletionContext >> completion [
	
	^ completion ifNil: [ completion := self getCompletion ]
]

{ #category : 'library path' }
GtkSourceCompletionContext >> ffiLibraryName [

	^ GtkSourceViewLibrary
]

{ #category : 'private' }
GtkSourceCompletionContext >> getBoundsBegin: begin end: end [

	self ffiCall: #(gboolean gtk_source_completion_context_get_bounds (
		self,
  		GtkTextIter *begin,
  		GtkTextIter *end))
]

{ #category : 'private' }
GtkSourceCompletionContext >> getBuffer [

	^ self ffiCall: #(GtkSourceBuffer *gtk_source_completion_context_get_buffer (self))
]

{ #category : 'private' }
GtkSourceCompletionContext >> getCompletion [

	^ self ffiCall: #(GtkSourceCompletion* gtk_source_completion_context_get_completion (self))
]

{ #category : 'testing' }
GtkSourceCompletionContext >> isBusy [

	^ self ffiCall: #(gboolean gtk_source_completion_context_get_busy (self))
]

{ #category : 'testing' }
GtkSourceCompletionContext >> isEmpty [

	^ self ffiCall: #(gboolean gtk_source_completion_context_get_empty (self))
]

{ #category : 'accessing' }
GtkSourceCompletionContext >> proposalsForProvider: provider [

	^ self ffiCall: #(GListModel *gtk_source_completion_context_get_proposals_for_provider (
  		self,
  		"GtkSourceCompletionProvider"GObject* provider))
]

{ #category : 'accessing' }
GtkSourceCompletionContext >> proposalsForProvider: provider results: results [

	^ self ffiCall: #(void gtk_source_completion_context_set_proposals_for_provider (
  		self,
  		"GtkSourceCompletionProvider"GObject* provider,
  		GListModel* results))
]

{ #category : 'accessing' }
GtkSourceCompletionContext >> withBoundsDo: aBlock [
	| begin end result |

	begin := GtkTextIter new.
	end := GtkTextIter new.
	result := self getBoundsBegin: begin end: end.
	result ifFalse: [ ^ self ].
	
	aBlock value: begin value: end
]

{ #category : 'accessing' }
GtkSourceCompletionContext >> word [

	^ self ffiCall: #(char* gtk_source_completion_context_get_word (self))
]
