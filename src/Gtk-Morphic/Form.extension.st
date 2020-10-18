Extension { #name : #Form }

{ #category : #'*Gtk-Morphic' }
Form >> asAthensSurface [

	^ AthensCairoSurface fromForm: self
]

{ #category : #'*Gtk-Morphic' }
Form >> asGdkPixbuf [

	^ GdkPixbuf newForm: self
]

{ #category : #'*Gtk-Morphic' }
Form >> asGtkImage [

	^ GtkImage newPixbuf: self asGdkPixbuf 
]
