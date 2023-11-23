Extension { #name : 'GdkCursor' }

{ #category : '*Gtk-Morphic' }
GdkCursor class >> fromForm: aForm [

	^ self newFromTexture: aForm asGdkTexture
]
