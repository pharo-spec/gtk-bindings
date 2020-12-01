"
GdkDevice — Object representing an input device

https://developer.gnome.org/gdk3/stable/GdkDevice.html
"
Class {
	#name : #GdkDevice,
	#superclass : #GObject,
	#category : #'Gtk-Misc'
}

{ #category : #'library path' }
GdkDevice class >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #accessing }
GdkDevice class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_device_get_type())
]

{ #category : #'library path' }
GdkDevice >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #'private primitives' }
GdkDevice >> getPosition: screen x: x y: y [

	^ self ffiCall: #(void gdk_device_get_position (
		self,
		GdkScreen **screen,
		gint *x,
		gint *y))
]

{ #category : #accessing }
GdkDevice >> position [
	| xBuffer yBuffer |
	
	xBuffer := FFIInt32 newBuffer.
	yBuffer := FFIInt32 newBuffer.
	self getPosition: GdkScreen default x: xBuffer y: yBuffer.
	^ (xBuffer signedLongAt: 1)@(yBuffer signedLongAt: 1)
]
