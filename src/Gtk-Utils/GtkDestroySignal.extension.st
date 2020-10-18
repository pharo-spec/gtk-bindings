Extension { #name : #GtkDestroySignal }

{ #category : #'*Gtk-Utils' }
GtkDestroySignal >> logIn: aLogger [

	^ aLogger logDestroySignal: self
]
