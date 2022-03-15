"
GtkCellRenderer — An object for rendering a single cell

https://developer.gnome.org/gtk3/unstable/GtkCellRenderer.html
"
Class {
	#name : #GtkCellRenderer,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : #'Gtk-Widget-CellRenderers'
}

{ #category : #private }
GtkCellRenderer class >> cellRendererNew [

	self subclassResponsibility
]

{ #category : #accessing }
GtkCellRenderer class >> gClassSize [
	"hardcoded. I took the size by executing sizeof in a C program"
	
	^ 264
]

{ #category : #accessing }
GtkCellRenderer class >> gSize [

	^ 32
]

{ #category : #accessing }
GtkCellRenderer class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_cell_renderer_get_type())
]

{ #category : #'instance creation' }
GtkCellRenderer class >> new [
	
	^ self cellRendererNew
]

{ #category : #private }
GtkCellRenderer >> getPaddingX: xpad y: ypad [

	^ self ffiCall: #(void gtk_cell_renderer_get_padding ( self, void *xpad, void * ypad ))
]

{ #category : #accessing }
GtkCellRenderer >> padding [
	| xBuffer yBuffer |
	
	xBuffer := FFIInt32 newBuffer.
	yBuffer := FFIInt32 newBuffer.
	
	self getPaddingX: xBuffer y: yBuffer.
	
	^ (xBuffer signedLongAt: 1) @ (yBuffer signedLongAt: 1)
	
]

{ #category : #accessing }
GtkCellRenderer >> width [

	^ self gObjectGetInteger: 'width'
]

{ #category : #accessing }
GtkCellRenderer >> width: aNumber [ 

	self gObjectSet: 'width' toInteger: aNumber
]
