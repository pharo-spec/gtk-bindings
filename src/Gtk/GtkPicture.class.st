"
https://docs.gtk.org/gtk4/class.Picture.html
"
Class {
	#name : 'GtkPicture',
	#superclass : 'GtkWidget',
	#category : 'Gtk-Widget-Display',
	#package : 'Gtk',
	#tag : 'Widget-Display'
}

{ #category : 'private' }
GtkPicture class >> gtkNew [

	^ self ffiCall: #(GtkPicture* gtk_picture_new (void))
]

{ #category : 'instance creation' }
GtkPicture class >> new [

	^ self gtkNew initialize
]

{ #category : 'accessing' }
GtkPicture >> clear [

	self setPaintable: GdkPaintable null
]

{ #category : 'accessing' }
GtkPicture >> setPaintable: paintable [

	self ffiCall: #(void gtk_picture_set_paintable (self, GdkPaintable* paintable))
]
