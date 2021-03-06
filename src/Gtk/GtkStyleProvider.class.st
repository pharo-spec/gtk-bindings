"
GtkStyleProvider — Interface to provide style information to GtkStyleContext

https://developer.gnome.org/gtk3/stable/GtkStyleProvider.html
"
Class {
	#name : #GtkStyleProvider,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Misc'
}

{ #category : #accessing }
GtkStyleProvider class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_style_provider_get_type())
]
