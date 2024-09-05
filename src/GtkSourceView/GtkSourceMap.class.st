"
GtkSourceMap — Widget that displays a map for a specific GtkSourceView

https://developer-old.gnome.org/gtksourceview/stable/GtkSourceMap.html#gtk-source-map-new
"
Class {
	#name : 'GtkSourceMap',
	#superclass : 'GtkSourceView',
	#instVars : [
		'view'
	],
	#category : 'GtkSourceView-Base',
	#package : 'GtkSourceView',
	#tag : 'Base'
}

{ #category : 'private' }
GtkSourceMap class >> gtkSourceMapNew [

	^ self ffiCall: #(GtkSourceMap *gtk_source_map_new (void))
]

{ #category : 'instance creation' }
GtkSourceMap class >> new [

	^ self gtkSourceMapNew initialize
]

{ #category : 'private' }
GtkSourceMap >> getView [

	self ffiCall: #(GtkSourceView *gtk_source_map_get_view (self))
]

{ #category : 'private' }
GtkSourceMap >> setView: aSourceView [

	self ffiCall: #(void gtk_source_map_set_view (self, GtkSourceView *aSourceView))
]

{ #category : 'accessing' }
GtkSourceMap >> view [

	^ view ifNil: [ view := self getView ]
]

{ #category : 'accessing' }
GtkSourceMap >> view: aSourceView [

	view := aSourceView.
	self setView: aSourceView
]
