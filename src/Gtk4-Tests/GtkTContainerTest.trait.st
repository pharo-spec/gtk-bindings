Trait {
	#name : #GtkTContainerTest,
	#category : #'Gtk4-Tests-Widget'
}

{ #category : #'instance creation' }
GtkTContainerTest >> newChildWidget [

	^ GtkLabel newLabel: 'Test'
]
