"
https://docs.gtk.org/gtk4/class.TextChildAnchor.html
"
Class {
	#name : 'GtkTextChildAnchor',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'private' }
GtkTextChildAnchor class >> gtkNew [

	^ self ffiCall: #(GtkTextChildAnchor* gtk_text_child_anchor_new (void))
]

{ #category : 'instance creation' }
GtkTextChildAnchor class >> new [

	^ self gtkNew initialize
]
