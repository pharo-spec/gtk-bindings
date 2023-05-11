"
[https://developer.gnome.org/gtksourceview/stable/GtkSourceSearchContext.html](https://developer.gnome.org/gtksourceview/stable/GtkSourceSearchSettings.html)
"
Class {
	#name : #GtkSourceSearchContext,
	#superclass : #GObject,
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#instVars : [
		'settings',
		'buffer',
		'lastForwardCallback'
	],
	#category : #'GtkSourceView-Search'
}

{ #category : #private }
GtkSourceSearchContext class >> gtkSourceSearchNew: buffer settings: settings [

	^ self 
		ffiCall: #(GtkSourceSearchContext *gtk_source_search_context_new (
			GtkSourceBuffer *buffer,
   			GtkSourceSearchSettings *settings)) 
		module: GtkSourceViewLibrary
]

{ #category : #'instance creation' }
GtkSourceSearchContext class >> newBuffer: aSourceBuffer [
	
	^ self 
		newBuffer: aSourceBuffer 
		settings: GtkSourceSearchSettings null
]

{ #category : #'instance creation' }
GtkSourceSearchContext class >> newBuffer: aSourceBuffer settings: aSourceSettings [

	^ (self gtkSourceSearchNew: aSourceBuffer settings: aSourceSettings) initialize
]

{ #category : #accessing }
GtkSourceSearchContext >> backward [

	^ self backward: ((self buffer iterAtMark: self buffer insertMark)
		backwardChar;
		yourself)
]

{ #category : #accessing }
GtkSourceSearchContext >> backward: iter [

	^ self backward: iter thenDo: [ :start :end :wrappedAround | ]
]

{ #category : #private }
GtkSourceSearchContext >> backward: iter matchStart: match_start matchEnd: match_end wrappedAround: has_wrapped_around [

	^ self 
		ffiCall: #(gboolean gtk_source_search_context_backward (
			self,
 			GtkTextIter *iter,
			GtkTextIter *match_start,
			GtkTextIter *match_end,
			gboolean *has_wrapped_around))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceSearchContext >> backward: iter thenDo: aBlock [
	| matchStart matchEnd wrappedAroundBuffer backward |
		
	matchStart := GtkTextIter new.
	matchEnd := GtkTextIter new.
	wrappedAroundBuffer := (GObject resolveType: #gboolean) newBuffer.
	
	backward := self 
		backward: iter 
		matchStart: matchStart getHandle
		matchEnd: matchEnd getHandle
		wrappedAround: wrappedAroundBuffer.
	backward ifFalse: [ ^ self ].
	aBlock 
		value: matchStart 
		value: matchEnd
		value: (wrappedAroundBuffer booleanAt: 1)
]

{ #category : #accessing }
GtkSourceSearchContext >> backwardThenDo: aBlock [

	^ self 
		backward: ((self buffer iterAtMark: self buffer insertMark)
			backwardChar;
			yourself)
		thenDo: aBlock
]

{ #category : #accessing }
GtkSourceSearchContext >> buffer [
	
	^ buffer ifNil: [ buffer := self getBuffer ]
]

{ #category : #accessing }
GtkSourceSearchContext >> forward [

	^ self forward: ((self buffer iterAtMark: self buffer insertMark)
		forwardChar;
		yourself)
]

{ #category : #accessing }
GtkSourceSearchContext >> forward: iter [

	^ self forward: iter thenDo: [ :start :end :wrappedAround | ]
]

{ #category : #private }
GtkSourceSearchContext >> forward: iter matchStart: match_start matchEnd: match_end wrappedAround: has_wrapped_around [

	^ self 
		ffiCall: #(gboolean gtk_source_search_context_forward (
			self,
 			GtkTextIter *iter,
			GtkTextIter *match_start,
			GtkTextIter *match_end,
			gboolean *has_wrapped_around))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceSearchContext >> forward: iter thenDo: aBlock [
	| matchStart matchEnd wrappedAroundBuffer forwarded |
		
	matchStart := GtkTextIter new.
	matchEnd := GtkTextIter new.
	wrappedAroundBuffer := (GObject resolveType: #gboolean) newBuffer.
	
	forwarded := self 
		forward: iter 
		matchStart: matchStart getHandle
		matchEnd: matchEnd getHandle
		wrappedAround: wrappedAroundBuffer.
	forwarded ifFalse: [ ^ self ].
	aBlock 
		value: matchStart 
		value: matchEnd
		value: (wrappedAroundBuffer booleanAt: 1)
]

{ #category : #accessing }
GtkSourceSearchContext >> forwardAsync: iter onFirstPositionDo: aBlock [ 

	self 
		forwardAsync: iter 
		onReadyDo: [ :result |
			| start end found |
				
			start := GtkTextIter new.		
			end := GtkTextIter new.

			found := self 
				forwardFinish: result 
				start: start 
				end: end 
				wrapped: ExternalAddress null 
				error: ExternalAddress null.
			found ifTrue: [ 
				aBlock value: start value: end ] ]
]

{ #category : #accessing }
GtkSourceSearchContext >> forwardAsync: iter onReadyDo: aBlock [ 

	self 
		forwardAsync: iter 
		ready: (lastForwardCallback := GCallback 
			signature: #(void (void *context, void *result, gpointer user_data)) 
			block: [ :context :result :user_data | 
				aBlock value: result ] )
]

{ #category : #private }
GtkSourceSearchContext >> forwardAsync: iter ready: callback [

	^ self ffiCall: #(void gtk_source_search_context_forward_async (
		self,
		GtkTextIter *iter,
		"GCancellable *cancellable"NULL,
		"GAsyncReadyCallback"GCallback callback,
		"gpointer user_data"NULL))
]

{ #category : #private }
GtkSourceSearchContext >> forwardFinish: result start: match_start end: match_end wrapped: has_wrapped_around error: error [

	self ffiCall: #(gboolean gtk_source_search_context_forward_finish (
		self,
		"GAsyncResult *"void *result,
		GtkTextIter *match_start,
		GtkTextIter *match_end,
		"gboolean *"void *has_wrapped_around,
		"GError **"void *error))
]

{ #category : #accessing }
GtkSourceSearchContext >> forwardThenDo: aBlock [

	^ self 
		forward: ((self buffer iterAtMark: self buffer insertMark)
			forwardChar;
			yourself)
		thenDo: aBlock
]

{ #category : #private }
GtkSourceSearchContext >> getBuffer [

	^ self 
		ffiCall: #(GtkSourceBuffer *gtk_source_search_context_get_buffer (self)) 
		module: GtkSourceViewLibrary
]

{ #category : #private }
GtkSourceSearchContext >> getOccurrencePositionStart: match_start end: match_end [

	self ffiCall: #(gint gtk_source_search_context_get_occurrence_position (
		self,
		"GtkTextIter *"void *match_start,
		"GtkTextIter *"void *match_end))
]

{ #category : #accessing }
GtkSourceSearchContext >> highlight: highlight [

	^ self 
		ffiCall: #(void gtk_source_search_context_set_highlight (
			self,
			gboolean highlight)) 
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceSearchContext >> isHighlight [

	^ self 
		ffiCall: #(gboolean gtk_source_search_context_get_highlight (self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceSearchContext >> occurrencesCount [

	self ffiCall: #(gint gtk_source_search_context_get_occurrences_count (self))
]

{ #category : #'accessing settings' }
GtkSourceSearchContext >> searchText: aString [
	
	self settings searchText: aString
]

{ #category : #'accessing settings' }
GtkSourceSearchContext >> settings [

	^ settings ifNil: [ 
		settings := self
			gObjectGetHandle: 'settings'
			as: GtkSourceSearchSettings ]
]
