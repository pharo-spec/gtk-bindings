Extension { #name : #FT2FFILibrary }

{ #category : #'*Gtk-FreeType' }
FT2FFILibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'*Gtk-FreeType' }
FT2FFILibrary >> macLibraryName [ 
	
	^ GMacLibraryFinder findAnyLibrary: #('libfreetype.6.dylib' 'libfreetype.dylib')
]

{ #category : #'*Gtk-FreeType' }
FT2FFILibrary >> runner [

	^ TFSameThreadRunner uniqueInstance
]
