"
https://docs.gtk.org/gtk4/class.IconPaintable.html
"
Class {
	#name : #GtkIconPaintable,
	#superclass : #GObject,
	#traits : 'GtkTLibrary + GdkTPaintable',
	#classTraits : 'GtkTLibrary classTrait + GdkTPaintable classTrait',
	#category : #'Gtk-Widget-Display'
}

{ #category : #'instance creation' }
GtkIconPaintable class >> newFromIconName: iconName size: iconSize [

	^ GtkIconTheme default
		lookupIconName: iconName
		size: iconSize
]

{ #category : #accessing }
GtkIconPaintable >> name [

	^ self ffiCall: #(char* gtk_icon_paintable_get_icon_name (self))
]