"
GtkContainer — Base class for widgets which contain other widgets

https://developer.gnome.org/gtk3/stable/GtkContainer.html
"
Class {
	#name : 'GtkContainer',
	#superclass : 'GtkWidget',
	#traits : 'GtkTContainer',
	#classTraits : 'GtkTContainer classTrait',
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'testing' }
GtkContainer class >> isDeprecated [

	^ self = GtkContainer
]

{ #category : 'initialization' }
GtkContainer >> initialize [

	super initialize.
	self initializeTContainer.
	
]
