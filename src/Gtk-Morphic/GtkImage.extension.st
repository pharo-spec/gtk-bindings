Extension { #name : #GtkImage }

{ #category : #'*Gtk-Morphic' }
GtkImage class >> newForm: aForm [

	^ self newPixbuf: aForm asGdkPixbuf
]

{ #category : #'*Gtk-Morphic' }
GtkImage class >> newMorph: anImageMorph [
	| surface texture |
	
	surface := self surfaceFor: anImageMorph.
	texture := surface asGdkTexture.
	^ self newPaintable: texture
]

{ #category : #'*Gtk-Morphic' }
GtkImage >> newMorph: anImageMorph [

	| surf |
	surf := self surfaceFor: anImageMorph.
	^ (self imageNewFromSurface: surf) initialize
]
