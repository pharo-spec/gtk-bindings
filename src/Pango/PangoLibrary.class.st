"
I'm a library to add bindings with pango.
"
Class {
	#name : 'PangoLibrary',
	#superclass : 'FFILibrary',
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'accessing' }
PangoLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : 'accessing - platform' }
PangoLibrary >> macLibraryName [

	^ '/usr/local/lib/libpango-1.0.0.dylib'
]

{ #category : 'accessing' }
PangoLibrary >> runner [
	
	^ GObjectLibrary naturalRunner
]

{ #category : 'accessing - platform' }
PangoLibrary >> unix32LibraryName [ 

	^ '/usr/lib/i386-linux-gnu/libpango-1.0.so.0'
]

{ #category : 'accessing - platform' }
PangoLibrary >> unix64LibraryName [ 

	^ FFIUnix64LibraryFinder findAnyLibrary: #('libpango-1.0.so' 'libpango-1.0.so.0')
]

{ #category : 'accessing - platform' }
PangoLibrary >> versionString [
	^ self ffiCall: #( String pango_version_string #() )

]

{ #category : 'accessing - platform' }
PangoLibrary >> win32LibraryName [
	
	"this could be  libpangowin32-1.0-0.dll instead"
	^ 'libpango-1.0-0.dll'
]
