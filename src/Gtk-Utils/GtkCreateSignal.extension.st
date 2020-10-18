Extension { #name : #GtkCreateSignal }

{ #category : #'*Gtk-Utils' }
GtkCreateSignal >> logIn: aLogger [

	^ aLogger logCreateSignal: self
]
