Extension { #name : 'GdkPixbuf' }

{ #category : '*Gtk-Morphic' }
GdkPixbuf class >> newForm: aForm [

	^ self 
		newFromSurface: aForm asAthensSurface
		width: aForm width asInteger
		height: aForm height asInteger
]

{ #category : '*Gtk-Morphic' }
GdkPixbuf class >> newMorph: anImageMorph [

	^ self 
		newFromSurface: (GtkCairoSurface fromImageMorph: anImageMorph) 
		width: anImageMorph width asInteger
		height: anImageMorph height asInteger
]
