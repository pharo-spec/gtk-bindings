Extension { #name : #GdkCursor }

{ #category : #'*Gtk-Morphic' }
GdkCursor class >> fromForm: aForm [
	| cursorSurface |
	
	cursorSurface := GtkCairoSurface fromForm: aForm.
	^ self newFromSurface: cursorSurface
]
