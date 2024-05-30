"
I am the library to GtkSourceView. 
"
Class {
	#name : 'GtkSourceViewLibrary',
	#superclass : 'FFILibrary',
	#category : 'GtkSourceView-Base',
	#package : 'GtkSourceView',
	#tag : 'Base'
}

{ #category : 'converting' }
GtkSourceViewLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : 'private - initialization' }
GtkSourceViewLibrary >> init [

	^ self ffiCall: #(void gtk_source_init ())
]

{ #category : 'testing' }
GtkSourceViewLibrary >> isAvailable [
	self flag: #TODO.	"Find a way to do this just once"
	^ self libraryName asFileReference exists
		and: [ (DynamicLoader loadLibrary: self libraryName) notNil ]
]

{ #category : 'accessing platform' }
GtkSourceViewLibrary >> macLibraryName [

	^ GMacLibraryFinder findAnyLibrary: #('libgtksourceview-4.0.dylib' 'libgtksourceview-4.dylib')
]

{ #category : 'converting' }
GtkSourceViewLibrary >> runner [
	
	^ GObjectLibrary naturalRunner
]

{ #category : 'accessing platform' }
GtkSourceViewLibrary >> unix64LibraryName [

	GtkLibrary isDebug ifTrue: [ ^ '/home/esteban/jhbuild/install/lib/libgtksourceview-5.so' ].
	^ FFIUnix64LibraryFinder findLibrary: 'libgtksourceview-5.so'
]

{ #category : 'accessing platform' }
GtkSourceViewLibrary >> win32LibraryName [ 

	^ 'libgtksourceview-3.0-1.dll'
]
