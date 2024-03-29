"
GdkScreen — Object representing a physical screen

https://developer.gnome.org/gdk3/stable/GdkScreen.html
"
Class {
	#name : #GdkScreen,
	#superclass : #GObject,
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : #'Gdk-Base'
}

{ #category : #'instance creation' }
GdkScreen class >> default [

	"do not send #initialize here because we do not need it (and keeping a reference 
	 is useless since this is kept in Gtk3."
	^ self getDefault "initialize"
]

{ #category : #accessing }
GdkScreen class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_screen_get_type())
]

{ #category : #private }
GdkScreen class >> getDefault [

	^ self ffiCall: #(GdkScreen *gdk_screen_get_default ())
]

{ #category : #'as yet unclassified' }
GdkScreen >> resolution [

	^ self ffiCall: #(gdouble gdk_screen_get_resolution ( self ))
]
