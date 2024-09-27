Extension { #name : 'GdkCursor' }

{ #category : '*Gtk-Morphic' }
GdkCursor class >> fromForm: aForm [
	| texture |
	
	texture := aForm asGdkTexture.
	^ [ self newFromTexture: texture ]
		ensure: [ texture objectUnrefNow ]
]
