Trait {
	#name : 'GtkTContainerTest',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'instance creation' }
GtkTContainerTest >> newChildWidget [

	^ GtkLabel newLabel: 'Test'
]
