"
GtkFixed — A container which allows you to position widgets at fixed coordinates

https://docs.gtk.org/gtk4/class.Fixed.html

TODO: set_child_transform
"
Class {
	#name : 'GtkFixed',
	#superclass : 'GtkWidget',
	#traits : 'GtkTContainer',
	#classTraits : 'GtkTContainer classTrait',
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'accessing' }
GtkFixed class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_fixed_get_type())
]

{ #category : 'private' }
GtkFixed class >> gtkFixedNew [

	^ self ffiCall: #(GtkFixed *gtk_fixed_new ())
]

{ #category : 'instance creation' }
GtkFixed class >> new [

	^ self gtkFixedNew initialize
]

{ #category : 'private' }
GtkFixed >> basicRemove: child [

	self ffiCall: #(void gtk_fixed_remove (self, GtkWidget* child))
]

{ #category : 'initialization' }
GtkFixed >> initialize [

	super initialize.
	self initializeTContainer
]

{ #category : 'accessing' }
GtkFixed >> moveChild: aChild to: aPoint [

	self 
		moveChild: aChild 
		toX: aPoint x 
		toY: aPoint y
]

{ #category : 'private' }
GtkFixed >> moveChild: aChild toX: x toY: y [

	^ self ffiCall: #(void gtk_fixed_move (
		self,
		GtkWidget *aChild,
		gint x,
		gint y))
]

{ #category : 'accessing' }
GtkFixed >> putChild: aChild at: aPoint [

	self keepWidget: aChild.
	self 
		putChild: aChild 
		atX: aPoint x 
		atY: aPoint y
]

{ #category : 'private' }
GtkFixed >> putChild: aChild atX: x atY: y [

	^ self ffiCall: #(void gtk_fixed_put (
		self,
		GtkWidget *aChild,
		gint x,
 		gint y))
]
