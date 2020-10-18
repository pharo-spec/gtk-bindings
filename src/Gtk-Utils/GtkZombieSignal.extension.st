Extension { #name : #GtkZombieSignal }

{ #category : #'*Gtk-Utils' }
GtkZombieSignal >> logIn: aLogger [

	^ aLogger logZombieSignal: self
]
