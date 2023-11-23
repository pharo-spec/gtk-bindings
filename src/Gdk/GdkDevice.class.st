"
GdkDevice — Object representing an input device

https://developer.gnome.org/gdk3/stable/GdkDevice.html
"
Class {
	#name : 'GdkDevice',
	#superclass : 'GObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : 'Gdk-Base',
	#package : 'Gdk',
	#tag : 'Base'
}

{ #category : 'accessing' }
GdkDevice class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_device_get_type())
]

{ #category : 'private primitives' }
GdkDevice >> getPosition: screen x: x y: y [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GdkDevice >> position [

	self deprecated: #Gtk4
]
