"
https://docs.gtk.org/gtk4/class.IconPaintable.html
"
Class {
	#name : 'GtkIconPaintable',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary + GdkTPaintable',
	#classTraits : 'GtkTLibrary classTrait + GdkTPaintable classTrait',
	#category : 'Gtk-Widget-Display',
	#package : 'Gtk',
	#tag : 'Widget-Display'
}

{ #category : 'instance creation' }
GtkIconPaintable class >> newFromIconName: iconName size: iconSize [
	| icon |

	icon := GtkIconTheme default
		lookupIconName: iconName
		size: iconSize.
	icon ifNotNil: [ icon initialize ].
	^ icon
]

{ #category : 'accessing' }
GtkIconPaintable >> name [

	^ self ffiCall: #(char* gtk_icon_paintable_get_icon_name (self))
]
