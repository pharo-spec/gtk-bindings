Extension { #name : #GtkImage }

{ #category : #'*Gtk-Morphic' }
GtkImage class >> newForm: aForm [

	^ self newMorph: aForm asMorph
]

{ #category : #'*Gtk-Morphic' }
GtkImage class >> newMorph: anImageMorph [

	| surf |
	surf := self surfaceFor: anImageMorph.
	^ (self imageNewFromSurface: surf) initialize
]
