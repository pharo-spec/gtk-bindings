Trait {
	#name : #GtkTContainerTest,
	#category : #'Gtk-Tests-Widget'
}

{ #category : #'instance creation' }
GtkTContainerTest >> newChildWidget [

	^ GtkLabel newLabel: 'Test'
]
