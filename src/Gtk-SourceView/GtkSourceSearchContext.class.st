"
[https://developer.gnome.org/gtksourceview/stable/GtkSourceSearchContext.html](https://developer.gnome.org/gtksourceview/stable/GtkSourceSearchSettings.html)
"
Class {
	#name : #GtkSourceSearchContext,
	#superclass : #GObject,
	#instVars : [
		'settings',
		'buffer'
	],
	#category : #'Gtk-SourceView-Base'
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
	| matchStart matchEnd wrappedAroundBuffer |
		
	matchStart := GtkTextIter null.
	matchEnd := GtkTextIter null.
	wrappedAroundBuffer := (GObject resolveType: #gboolean) newBuffer.
	
	^ self 
		forward: iter 
		matchStart: matchStart 
		matchEnd: matchEnd 
		wrappedAround: wrappedAroundBuffer
]

{ #category : #accessing }
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

{ #category : #private }
GtkSourceSearchContext >> getBuffer [

	^ self 
		ffiCall: #(GtkSourceBuffer *gtk_source_search_context_get_buffer (self)) 
		module: GtkSourceViewLibrary
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

	^ self 
		ffiCall: #(gint gtk_source_search_context_get_occurrences_count (self)) 
		module: GtkSourceViewLibrary
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
