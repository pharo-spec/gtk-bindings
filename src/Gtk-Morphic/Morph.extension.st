Extension { #name : 'Morph' }

{ #category : '*Gtk-Morphic' }
Morph >> asGdkPixbuf [

	^ self asForm asGdkPixbuf
]

{ #category : '*Gtk-Morphic' }
Morph >> asGtkImage [

	^ GtkImage newMorph: self
]
