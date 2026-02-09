"
I am the library to GtkSourceView. 
"
Class {
	#name : 'GtkSourceViewLibrary',
	#superclass : 'FFILibrary',
	#pools : [
		'GObjectTypes'
	],
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

	^ [ 
			self libraryName asFileReference exists
				and: [ (DynamicLoader loadLibrary: self libraryName) notNil ] 
		]
		on: Error do: [ :e | 
			"not located or not loaded = not available"
			false ]
]

{ #category : 'accessing - platform' }
GtkSourceViewLibrary >> macLibraryName [

	^ GMacLibraryFinder findLibrary: 'libgtksourceview-5.0.dylib'
]

{ #category : 'accessing' }
GtkSourceViewLibrary >> majorVersion [

	^ self ffiCall: #(guint gtk_source_get_major_version (void))
]

{ #category : 'accessing' }
GtkSourceViewLibrary >> microVersion [ 

	^ self ffiCall: #(guint gtk_source_get_micro_version (void))
]

{ #category : 'accessing' }
GtkSourceViewLibrary >> minorVersion [ 

	^ self ffiCall: #(guint gtk_source_get_minor_version (void))
]

{ #category : 'converting' }
GtkSourceViewLibrary >> runner [
	
	^ GObjectLibrary naturalRunner
]

{ #category : 'accessing - platform' }
GtkSourceViewLibrary >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findAnyLibrary: #('libgtksourceview-5.so' 'libgtksourceview-5.so.0')
]

{ #category : 'accessing' }
GtkSourceViewLibrary >> version [ 

	^ '{1}.{2}.{3}' format: {
		self majorVersion.
		self minorVersion.
		self microVersion.
	}
]

{ #category : 'accessing - platform' }
GtkSourceViewLibrary >> win32LibraryName [ 

	^ FFIWindowsLibraryFinder findLibrary: 'libgtksourceview-5-0.dll'
]
