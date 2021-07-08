"
I'm a library to add bindings with pango-freetype2.
"
Class {
	#name : #PangoFT2Library,
	#superclass : #FFILibrary,
	#category : #'Pango-Base'
}

{ #category : #accessing }
PangoFT2Library >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'accessing platform' }
PangoFT2Library >> macLibraryName [

	GObjectLibrary isDebug ifTrue: [ ^ '/Users/gtk3/gtk/inst/lib/libpangoft2-1.0.0.dylib' ]. 
	^ '/usr/local/lib/libpangoft2-1.0.0.dylib'
]

{ #category : #accessing }
PangoFT2Library >> runner [
	
	^ GObjectLibrary naturalRunner
]

{ #category : #'accessing platform' }
PangoFT2Library >> unix32LibraryName [ 

	^ '/usr/lib/i386-linux-gnu/libpangoft2-1.0.so.0'
]

{ #category : #'accessing platform' }
PangoFT2Library >> unix64LibraryName [ 

	GObjectLibrary isDebug ifTrue: [ ^ '/home/esteban/jhbuild/install/lib/libpangoft2-1.0.so' ]. 
	^ FFIUnix64LibraryFinder findLibrary: 'libpangoft2-1.0.so'
]

{ #category : #'accessing platform' }
PangoFT2Library >> win32LibraryName [
	
	^ 'libpangoft2-1.0-0.dll'
]
