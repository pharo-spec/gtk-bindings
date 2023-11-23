Extension { #name : 'GtkToolButton' }

{ #category : '*Gtk-Morphic' }
GtkToolButton class >> newForm: aForm label: aString [

	^ self 
		newIcon: aForm asGtkImage
		label: aString
]

{ #category : '*Gtk-Morphic' }
GtkToolButton class >> newMorph: anImageMorph label: aString [

	^ self 
		newIcon: anImageMorph asGtkImage
		label: aString
]
