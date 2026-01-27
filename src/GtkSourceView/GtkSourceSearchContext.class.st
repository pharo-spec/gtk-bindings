"
https://developer.gnome.org/gtksourceview/stable/GtkSourceSearchContext.html

**WARNING:** To move between matches, I am not using the async methods (in fact, I am just using 
forwardThenDo: and backwardThenDo:).
In case of usage of any of the others, we need to adapt them to preserve currentMatch, as its synchronous
siblings.
"
Class {
	#name : 'GtkSourceSearchContext',
	#superclass : 'GObject',
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#instVars : [
		'settings',
		'buffer',
		'lastForwardCallback',
		'matchStyle',
		'currentMatch'
	],
	#category : 'GtkSourceView-Search',
	#package : 'GtkSourceView',
	#tag : 'Search'
}

{ #category : 'private' }
GtkSourceSearchContext class >> gtkSourceSearchNew: buffer settings: settings [

	^ self 
		ffiCall: #(GtkSourceSearchContext *gtk_source_search_context_new (
			GtkSourceBuffer *buffer,
   			GtkSourceSearchSettings *settings)) 
		module: GtkSourceViewLibrary
]

{ #category : 'instance creation' }
GtkSourceSearchContext class >> newBuffer: aSourceBuffer [
	
	^ self 
		newBuffer: aSourceBuffer 
		settings: GtkSourceSearchSettings null
]

{ #category : 'instance creation' }
GtkSourceSearchContext class >> newBuffer: aSourceBuffer settings: aSourceSettings [

	^ (self gtkSourceSearchNew: aSourceBuffer settings: aSourceSettings) initialize
]

{ #category : 'accessing' }
GtkSourceSearchContext >> backward [

	^ self backward: ((self buffer iterAtMark: self buffer insertMark)
		backwardChar;
		yourself)
]

{ #category : 'accessing' }
GtkSourceSearchContext >> backward: iter [

	^ self backward: iter thenDo: [ :start :end :wrappedAround | ]
]

{ #category : 'private' }
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

{ #category : 'accessing' }
GtkSourceSearchContext >> backward: iter thenDo: aBlock [
	| matchStart matchEnd wrappedAroundBuffer backward |
		
	matchStart := GtkTextIter new.
	matchEnd := GtkTextIter new.
	wrappedAroundBuffer := (GObject resolveType: #gboolean) newBuffer.
	
	self resetCurrentMatch.
	
	backward := self 
		backward: iter 
		matchStart: matchStart getHandle
		matchEnd: matchEnd getHandle
		wrappedAround: wrappedAroundBuffer.
	
	backward ifFalse: [ ^ self ].
	
	self saveCurrentMatchStart: matchStart end: matchEnd.
	
	aBlock 
		value: matchStart 
		value: matchEnd
		value: (wrappedAroundBuffer booleanAt: 1)
]

{ #category : 'accessing' }
GtkSourceSearchContext >> backwardThenDo: aBlock [
	| iter |

	"if we are already in a match, start from the end of the current match"
	iter := currentMatch 
		ifNotNil: [ currentMatch first ]
		ifNil: [ self buffer iterAtMark: self buffer insertMark ].

	^ self 
		backward: iter
		thenDo: aBlock
]

{ #category : 'accessing' }
GtkSourceSearchContext >> buffer [
	
	^ buffer ifNil: [ buffer := self getBuffer ]
]

{ #category : 'accessing' }
GtkSourceSearchContext >> currentMatchRange [

	currentMatch ifNil: [ ^ 0 to: 0 ].
	
	^ { 
		currentMatch first offset.
		currentMatch second offset
	}
]

{ #category : 'accessing' }
GtkSourceSearchContext >> forward [

	^ self forward: ((self buffer iterAtMark: self buffer insertMark)
		forwardChar;
		yourself)
]

{ #category : 'accessing' }
GtkSourceSearchContext >> forward: iter [

	^ self forward: iter thenDo: [ :start :end :wrappedAround | ]
]

{ #category : 'private' }
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

{ #category : 'accessing' }
GtkSourceSearchContext >> forward: iter thenDo: aBlock [
	| matchStart matchEnd wrappedAroundBuffer forwarded |
		
	matchStart := GtkTextIter new.
	matchEnd := GtkTextIter new.
	wrappedAroundBuffer := (GObject resolveType: #gboolean) newBuffer.
	
self resetCurrentMatch.
	
	forwarded := self 
		forward: iter 
		matchStart: matchStart getHandle
		matchEnd: matchEnd getHandle
		wrappedAround: wrappedAroundBuffer.
		
	forwarded ifFalse: [ ^ self ].
	
	self saveCurrentMatchStart: matchStart end: matchEnd.
	
	aBlock 
		value: matchStart 
		value: matchEnd
		value: (wrappedAroundBuffer booleanAt: 1)
]

{ #category : 'accessing - async' }
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
				self saveCurrentMatchStart: start end: end.
				aBlock value: start value: end ] ]
]

{ #category : 'accessing - async' }
GtkSourceSearchContext >> forwardAsync: iter onReadyDo: aBlock [ 

	self 
		forwardAsync: iter 
		ready: (lastForwardCallback := GCallback 
			signature: #(void (void *context, void *result, gpointer user_data)) 
			block: [ :context :result :user_data | 
				aBlock value: result ] )
]

{ #category : 'private' }
GtkSourceSearchContext >> forwardAsync: iter ready: callback [

	^ self ffiCall: #(void gtk_source_search_context_forward_async (
		self,
		GtkTextIter *iter,
		"GCancellable *cancellable"NULL,
		"GAsyncReadyCallback"GCallback callback,
		"gpointer user_data"NULL))
]

{ #category : 'private' }
GtkSourceSearchContext >> forwardFinish: result start: match_start end: match_end wrapped: has_wrapped_around error: error [

	self ffiCall: #(gboolean gtk_source_search_context_forward_finish (
		self,
		"GAsyncResult *"void *result,
		GtkTextIter *match_start,
		GtkTextIter *match_end,
		"gboolean *"void *has_wrapped_around,
		"GError **"void *error))
]

{ #category : 'accessing' }
GtkSourceSearchContext >> forwardThenDo: aBlock [
	| iter |

	"if we are already in a match, start from the end of the current match"
	iter := currentMatch 
		ifNotNil: [ currentMatch second ]
		ifNil: [ 
			"not sure this is good (using the current cursor position).
			 for now, I am just searchign from the begining of the buffer :("
			"self buffer iterAtMark: self buffer insertMark"
			self buffer startIter ].

	^ self 
		forward: iter
		thenDo: aBlock
]

{ #category : 'accessing' }
GtkSourceSearchContext >> forwardThenReplaceWith: aString [ 
	| result error |

	self forwardThenDo: [ :start :end :wrappedAround | 
		error := GError newValueHolder.
		result := self
			replace: start
			end: end
			replace: aString 
			size: aString size
			error: error.
		result ifFalse: [ 
			Error signal: error value messageString ] ]
]

{ #category : 'private' }
GtkSourceSearchContext >> getBuffer [

	^ self 
		ffiCall: #(GtkSourceBuffer *gtk_source_search_context_get_buffer (self)) 
		module: GtkSourceViewLibrary
]

{ #category : 'private' }
GtkSourceSearchContext >> getMatchStyle [

	^ self 
		ffiCall: #(GtkSourceStyle* gtk_source_search_context_get_match_style (self))
		module: GtkSourceViewLibrary
]

{ #category : 'private' }
GtkSourceSearchContext >> getOccurrencePositionStart: match_start end: match_end [

	self ffiCall: #(gint gtk_source_search_context_get_occurrence_position (
		self,
		"const GtkTextIter *"void* match_start,
		"const GtkTextIter *"void* match_end))
]

{ #category : 'accessing' }
GtkSourceSearchContext >> highlight: highlight [

	^ self 
		ffiCall: #(void gtk_source_search_context_set_highlight (
			self,
			gboolean highlight)) 
		module: GtkSourceViewLibrary
]

{ #category : 'testing' }
GtkSourceSearchContext >> isHighlight [

	^ self 
		ffiCall: #(gboolean gtk_source_search_context_get_highlight (self))
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceSearchContext >> matchStyle [

	^ matchStyle ifNil: [ matchStyle := self getMatchStyle ]
]

{ #category : 'accessing' }
GtkSourceSearchContext >> matchStyle: aSourceStyle [

	matchStyle := aSourceStyle.
	self setMatchStyle: aSourceStyle
]

{ #category : 'accessing' }
GtkSourceSearchContext >> occurrencesCount [

	^ self ffiCall: #(gint gtk_source_search_context_get_occurrences_count (self))
]

{ #category : 'private' }
GtkSourceSearchContext >> replace: match_start end: match_end replace: replace size: replace_length error: error [

	self ffiCall: #(gboolean gtk_source_search_context_replace (
  		self,
  		GtkTextIter* match_start,
  		GtkTextIter* match_end,
  		const gchar* replace,
  		gint replace_length,
  		GError** error))
]

{ #category : 'private' }
GtkSourceSearchContext >> replaceAll: replace size: replace_length error: error [

	self ffiCall: #(guint gtk_source_search_context_replace_all (
  		self,
  		const gchar* replace,
  		gint replace_length,
  		GError** error))
]

{ #category : 'accessing' }
GtkSourceSearchContext >> replaceAllWith: aString [
	| result result error |
		
	error := GError newValueHolder.
	result := self 
		replaceAll: aString 
		size: aString size
		error: error.
		
	^ result
]

{ #category : 'accessing' }
GtkSourceSearchContext >> replaceMatchWith: aString [
	| result error |

	logger trace: aString.
	logger trace: currentMatch.

	currentMatch ifNil: [ ^ self ].

	error := GError newValueHolder.
	result := self
		replace: currentMatch first
		end: currentMatch second
		replace: aString 
		size: aString size
		error: error.

	logger trace: result.

	"replace current match"
	currentMatch := {
		currentMatch first.
		currentMatch first copy 
			forwardChars: aString size;
			yourself.
	}.

	result ifFalse: [ 
		Error signal: error value messageString ].
		
	^ result
]

{ #category : 'accessing' }
GtkSourceSearchContext >> replaceWith: aString [
	| result error |
	
	self withOccurrencePositionDo: [ :matchStart :matchEnd |
	
		error := GError newValueHolder.
		result := self 
			replace: matchStart getHandle
			end: matchEnd getHandle
			replace: aString 
			size: aString size
			error: error.
		result ifTrue: [ ^ self ].
	
		Error signal: error value messageString ]
]

{ #category : 'private' }
GtkSourceSearchContext >> resetCurrentMatch [

	currentMatch := nil
]

{ #category : 'private' }
GtkSourceSearchContext >> saveCurrentMatchStart: matchStart end: matchEnd [

	currentMatch := { matchStart. matchEnd }
]

{ #category : 'accessing - settings' }
GtkSourceSearchContext >> searchText: aString [
	
	self resetCurrentMatch.
	self settings searchText: aString
]

{ #category : 'private' }
GtkSourceSearchContext >> setMatchStyle: aStyle [

	self 
		ffiCall: #(void gtk_source_search_context_get_match_style (self, GtkSourceStyle *aStyle))
		module: GtkSourceViewLibrary
]

{ #category : 'accessing - settings' }
GtkSourceSearchContext >> settings [

	^ settings ifNil: [ 
		settings := self
			gObjectGetHandle: 'settings'
			as: GtkSourceSearchSettings ]
]

{ #category : 'accessing' }
GtkSourceSearchContext >> withOccurrencePositionDo: aBlock [
	| pos start end |
	
	start := GtkTextIter new.
	end := GtkTextIter new.
	
	pos := self 
		getOccurrencePositionStart: start referenceTo
		end: end referenceTo.
	
	pos = 0 ifTrue: [ ^ self ].
	
	aBlock
		value: start
		value: end
]
