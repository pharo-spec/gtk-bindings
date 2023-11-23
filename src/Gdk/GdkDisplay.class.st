"
GdkDisplay
GdkDisplay — Controls a set of GdkScreens and their associated input devices

https://developer.gnome.org/gdk3/stable/GdkDisplay.html
"
Class {
	#name : 'GdkDisplay',
	#superclass : 'GObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : 'Gdk-Base',
	#package : 'Gdk',
	#tag : 'Base'
}

{ #category : 'instance creation' }
GdkDisplay class >> default [ 

	"do not send #initialize here because we do not need it (and keeping a reference 
	 is useless since this is kept in Gtk3."
	^ self getDefault "initialize" 
]

{ #category : 'accessing' }
GdkDisplay class >> forceRectangleToFitLimits: aRect [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GdkDisplay class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_display_get_type())
]

{ #category : 'private' }
GdkDisplay class >> getDefault [

	^ self ffiCall: #(GdkDisplay *gdk_display_get_default (void))
]

{ #category : 'accessing' }
GdkDisplay >> clipboard [

	^ self ffiCall: #(GdkClipboard* gdk_display_get_clipboard (self))
]

{ #category : 'accessing' }
GdkDisplay >> defaultSeat [ 

	^ GdkSeat defaultForDisplay: self
]

{ #category : 'accessing' }
GdkDisplay >> monitorAt: aNumber [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GdkDisplay >> monitors [

	^ self ffiCall: #(GListModel *gdk_display_get_monitors (self))
]

{ #category : 'accessing' }
GdkDisplay >> primaryClipboard [

	^ self ffiCall: #(GdkClipboard *gdk_display_get_primary_clipboard (self))
]

{ #category : 'accessing' }
GdkDisplay >> primaryMonitor [

	self deprecated: #Gtk4
]
