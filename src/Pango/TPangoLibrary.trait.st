"
I add access to Pango library.
"
Trait {
	#name : 'TPangoLibrary',
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'library path' }
TPangoLibrary classSide >> ffiLibraryName [
	^ PangoLibrary
]

{ #category : 'library path' }
TPangoLibrary >> ffiLibraryName [
	^ self class ffiLibraryName
]
