"
https://developer-old.gnome.org/gdk3/stable/gdk3-Cursors.html
"
Class {
	#name : 'GdkCursor',
	#superclass : 'GObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : 'Gdk-Base',
	#package : 'Gdk',
	#tag : 'Base'
}

{ #category : 'accessing' }
GdkCursor class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_cursor_get_type())
]

{ #category : 'private' }
GdkCursor class >> gdkNewFromName: aName [

	^ self ffiCall: #(GdkCursor *gdk_cursor_new_from_name (
		const gchar *aName, 
		NULL))
]

{ #category : 'private' }
GdkCursor class >> gdkNewFromTexture: texture x: hotspot_x y: hotspot_y fallback: fallback [

	self ffiCall: #(GdkCursor* gdk_cursor_new_from_texture (
		GdkTexture* texture,
		int hotspot_x,
		int hotspot_y,
		GdkCursor* fallback))
]

{ #category : 'instance creation' }
GdkCursor class >> newDefault [

	^ self newFromName: 'default'
]

{ #category : 'instance creation' }
GdkCursor class >> newFromName: aName [

	^ (self gdkNewFromName: aName) initialize
]

{ #category : 'instance creation' }
GdkCursor class >> newFromTexture: aGdkTexture [

	^ (self
		gdkNewFromTexture: aGdkTexture
			x: 0
			y: 0
			fallback: GdkCursor null)
		initialize
]

{ #category : 'instance creation' }
GdkCursor class >> newHand [

	^ self newFromName: 'hand'
]

{ #category : 'instance creation' }
GdkCursor class >> newText [

	^ self newFromName: 'text'
]

{ #category : 'instance creation' }
GdkCursor class >> newWait [

	^ self newFromName: 'wait'
]
