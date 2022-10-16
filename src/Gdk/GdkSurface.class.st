Class {
	#name : #GdkSurface,
	#superclass : #GObject,
	#category : #'Gdk-Base'
}

{ #category : #'library path' }
GdkSurface class >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #accessing }
GdkSurface class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_window_get_type())
]

{ #category : #accessing }
GdkSurface >> beep [

	"Emits a short beep associated to window in the appropriate display, if supported. Otherwise, emits a short beep on the display just as gdk_display_beep()."
	self ffiCall: #(void gdk_surface_beep (GdkWindow * self))
]

{ #category : #accessing }
GdkSurface >> cursor: cursor [

	"Use #cursor: to store the cursor in the object"
	self ffiCall: #(void gdk_surface_set_cursor (self, GdkCursor *cursor))
]

{ #category : #accessing }
GdkSurface >> display [

	^ self ffiCall: #(GdkDisplay *gdk_surface_get_display (self))
]

{ #category : #'library path' }
GdkSurface >> ffiLibraryName [ 

	^ GdkLibrary
]

{ #category : #accessing }
GdkSurface >> opacity: opacity [

	self deprecated: #Gtk4.
]

{ #category : #accessing }
GdkSurface >> positionOfDevice: device [
	| xBuffer yBuffer |
	
	xBuffer := FFIFloat64 newBuffer.
	yBuffer := FFIFloat64 newBuffer.
	
	self positionOfDevice: device x: xBuffer y: yBuffer.
	
	^ (xBuffer doubleAt: 1) @ (yBuffer doubleAt: 1)
]

{ #category : #private }
GdkSurface >> positionOfDevice: device x: x y: y [

	^ self ffiCall: #(GdkWindow *gdk_surface_get_device_position (
		self, 
		GdkDevice *device,
		gdouble *x,
		gdouble *y,
		NULL))
]

{ #category : #accessing }
GdkSurface >> positionOfPointer [

	^ self positionOfDevice: GdkDisplay default defaultSeat pointer
]

{ #category : #'accessing - toplevel' }
GdkSurface >> state [

	^ self ffiCall: #(#GdkTopLevelState gdk_toplevel_get_state (self))
]
