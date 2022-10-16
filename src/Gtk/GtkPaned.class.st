"
A widget with two panes, arranged either horizontally or vertically.

https://docs.gtk.org/gtk4/class.Paned.html
"
Class {
	#name : #GtkPaned,
	#superclass : #GtkContainer,
	#classTraits : 'GtkTContainer classTrait',
	#instVars : [
		'firstChild',
		'secondChild'
	],
	#pools : [
		'GtkOrientation'
	],
	#category : #'Gtk-Widget-Container'
}

{ #category : #accessing }
GtkPaned class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_paned_get_type())
]

{ #category : #'instance creation' }
GtkPaned class >> new [ 
	self error: 'Use one of my siblings'
]

{ #category : #'instance creation' }
GtkPaned class >> newHorizontal [
	^ (self panedNew: GTK_ORIENTATION_HORIZONTAL) initialize
]

{ #category : #'instance creation' }
GtkPaned class >> newVertical [
	^ (self panedNew: GTK_ORIENTATION_VERTICAL) initialize	
]

{ #category : #private }
GtkPaned class >> panedNew: orientation [
	^ self ffiCall: #(GtkPaned *gtk_paned_new (GtkOrientation orientation))
]

{ #category : #private }
GtkPaned >> basicPack1: child resize: resize shrink: shrink [ 

	^ self ffiCall: #(void gtk_paned_pack1 (self, GtkWidget *child, gboolean resize, gboolean shrink))
]

{ #category : #private }
GtkPaned >> basicPack2: child resize: resize shrink: shrink [
 
	^ self ffiCall: #(void gtk_paned_pack2 (self, GtkWidget *child, gboolean resize, gboolean shrink))
]

{ #category : #accessing }
GtkPaned >> pack1: child [

	^ self 
		pack1: child 
		resize: true 
		shrink: true
]

{ #category : #accessing }
GtkPaned >> pack1: child resize: resize shrink: shrink [ 

	firstChild := child.
	self 
		basicPack1: child 
		resize: resize 
		shrink: shrink 
]

{ #category : #accessing }
GtkPaned >> pack2: child [

	^ self 
		pack2: child 
		resize: true 
		shrink: true
]

{ #category : #accessing }
GtkPaned >> pack2: child resize: resize shrink: shrink [ 

	secondChild := child.
	self 
		basicPack2: child 
		resize: resize 
		shrink: shrink 
]

{ #category : #accessing }
GtkPaned >> position [

	self ffiCall: #(gint gtk_paned_get_position (self))
]

{ #category : #accessing }
GtkPaned >> position: position [

	self ffiCall: #(void gtk_paned_set_position (self, gint position))
]

{ #category : #accessing }
GtkPaned >> wideHandle: aBoolean [

	self gObjectSet: 'wide-handle' toBoolean: aBoolean
]
