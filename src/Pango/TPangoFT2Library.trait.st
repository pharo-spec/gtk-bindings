"
I add access to Pango Freetype2 library.
"
Trait {
	#name : 'TPangoFT2Library',
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'library path' }
TPangoFT2Library classSide >> ffiLibraryName [
	^ PangoFT2Library
]

{ #category : 'library path' }
TPangoFT2Library >> ffiLibraryName [
	^ self class ffiLibraryName
]
