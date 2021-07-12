"
I'm a base object for the Gtk3 hierarchy. 
Since not all Gtk3 references are actually ""Gtk3 objects"", not all can be descendents of GObject (my main child), but they need to extend me directly.
"
Class {
	#name : #GBaseObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'GObjectTLibrary',
	#classTraits : 'GObjectTLibrary classTrait',
	#pools : [
		'GType',
		'GtkTypes'
	],
	#category : #'GObject-Base'
}

{ #category : #accessing }
GBaseObject class >> ffiLibrary [
	| theClass theMethod |
	
	"thisObject sender method = ffiCall:
	 thisObject sender sender method = the actual sending method"
	theMethod := thisContext sender sender method. 
	theClass := theMethod methodClass instanceSide.
	^  theClass ffiLibraryName asFFILibrary
]

{ #category : #private }
GBaseObject class >> isValidHandle: handle [

	^ handle notNil and: [ handle isNull not ]
]

{ #category : #'instance creation' }
GBaseObject class >> null [

	^ self fromHandle: ExternalAddress null
]

{ #category : #'external resource management' }
GBaseObject >> autoRelease [

	self engine resourceManager addResource: self
]

{ #category : #accessing }
GBaseObject >> engine [

	^ GEngine current
]

{ #category : #accessing }
GBaseObject >> ffiLibrary [
	| theClass theMethod |
	
	"When using ffi, the regular used method #ffiCall: will use the result of ffiLibrary 
	 which will take ffiLibraryName result and answer it as a library. 
	 While this work most of the time since we tend to use a single library for a whole 
	 framework, the case of Gtk is different: we use objects that are defined in different places: 
	 GObjectLibrary, GLib, Gdk, Gtk, ... and we create a hierarchy with them, for example GtkWidget 
	 (defined in Gtk) inherits from GObject (defined in GObject). We need to fix this problem, making 
	 possible that GtkWidget take its functions from gtk while GObject takes them from its own library.
	 This method accomplish this by takign the library from the ffiLibraryName defined in the 
	 class where the method is defined"

	"thisObject sender method = ffiCall:
	 thisObject sender sender method = the actual sending method"
	theMethod := thisContext sender sender method. 
	theClass := theMethod methodClass.
	^ theClass ffiLibraryName asFFILibrary
]

{ #category : #initialization }
GBaseObject >> initialize [
	"cancel chain because superclass attempts to setHandle: 
	 (which is incorrect, probably I should patch UFFI)"

]

{ #category : #testing }
GBaseObject >> isValidHandle [ 

	^ self class isValidHandle: self getHandle
]
