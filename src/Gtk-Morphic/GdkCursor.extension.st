Extension { #name : 'GdkCursor' }

{ #category : '*Gtk-Morphic' }
GdkCursor class >> fromForm: aForm [
	| texture |
	
	texture := aForm asUnownedGdkTexture.
	^ [ self newFromTexture: texture ]
		ensure: [ texture objectUnref ]
]
