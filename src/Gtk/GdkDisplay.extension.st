Extension { #name : #GdkDisplay }

{ #category : #'*Gtk' }
GdkDisplay >> defaultClipboard [

	^ GtkClipboard defaultForDisplay: self
]
