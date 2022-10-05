Class {
	#name : #GObjectLibrary,
	#superclass : #FFILibrary,
	#pools : [
		'GtkTypes'
	],
	#category : #'GObject-Base'
}

{ #category : #testing }
GObjectLibrary class >> isDebug [
	
	^ GMacLibraryFinder isDebug
]

{ #category : #accessing }
GObjectLibrary class >> naturalRunner [
	"Answer the 'natural' FFI client to run Gtk"
	
	^ GEngine ensureEngine naturalRunner
]

{ #category : #accessing }
GObjectLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'accessing platform' }
GObjectLibrary >> macLibraryName [
	"In linux and mac this is not really important, because once you load the main 
	 library, you will find also the symbols on dependent librarues. 
	 So I will point directly to the gtk3 library, just to simplify"

	^ GMacLibraryFinder findAnyLibrary: #('libgtk-3.0.dylib' 'libgtk-3.dylib')
]

{ #category : #accessing }
GObjectLibrary >> runner [
	
	^ self class naturalRunner
]

{ #category : #'accessing platform' }
GObjectLibrary >> unix64LibraryName [ 
	"In linux and mac this is not really important, because once you load the main 
	 library, you will find also the symbols on dependent librarues. 
	 So I will point directly to the gtk3 library, just to simplify"

	self class isDebug ifTrue: [ ^ '/home/esteban/jhbuild/install/lib/libgtk-3.so' ]. 
	^ FFIUnix64LibraryFinder findAnyLibrary: #('libgtk-3.so' 'libgtk-3.so.0')
]

{ #category : #'accessing platform' }
GObjectLibrary >> win32LibraryName [

	^ 'libgobject-2.0-0.dll'
]
