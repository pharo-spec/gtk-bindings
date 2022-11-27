Extension { #name : #GtkImage }

{ #category : #'*Gtk-Morphic' }
GtkImage class >> newForm: aForm [

	^ self newPixbuf: aForm asGdkPixbuf
]

{ #category : #'*Gtk-Morphic' }
GtkImage class >> newMorph: anImageMorph [

	^ self newPixbuf: anImageMorph asGdkPixbuf
]
