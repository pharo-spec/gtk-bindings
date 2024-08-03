Extension { #name : 'GtkImage' }

{ #category : '*Gtk-Morphic' }
GtkImage class >> newForm: aForm [

	^ self newPaintable: aForm asGdkPaintable
]

{ #category : '*Gtk-Morphic' }
GtkImage class >> newMorph: anImageMorph [
	| surface texture |
	
	surface := self surfaceFor: anImageMorph.
	texture := surface asGdkTexture.
	^ self newPaintable: texture
]
