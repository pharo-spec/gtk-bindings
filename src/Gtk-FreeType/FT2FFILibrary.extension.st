Extension { #name : #FT2FFILibrary }

{ #category : #'*Gtk-FreeType' }
FT2FFILibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #'*Gtk-FreeType' }
FT2FFILibrary >> macLibraryName [ 
	
	GtkLibrary isDebug ifTrue: [ ^ '/Users/gtk3/gtk/inst/lib/libfreetype.dylib' ]. 
	^ '/usr/local/lib/libfreetype.dylib'
	"^ 'libfreetype.dylib'"
]

{ #category : #'*Gtk-FreeType' }
FT2FFILibrary >> runner [

	^ TFSameThreadRunner uniqueInstance
]
