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

{ #category : #testing }
GtkCellRenderer class >> isDeprecated [

	^ true
]

{ #category : #'instance creation' }
GtkCellRenderer class >> new [
	
	^ self cellRendererNew
]

{ #category : #initialization }
GtkCellRenderer >> addedToTreeView: aTreeView column: aColumn [
	"do nothing, this is just useful for custom renderers and in certain cases"
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
GtkCellRenderer >> padding: aPoint [ 

	self setPaddingX: aPoint x y: aPoint y
]

{ #category : #accessing }
GtkCellRenderer >> sensitive [

	^ self ffiCall: #(gboolean gtk_cell_renderer_get_sensitive ( self ))
]

{ #category : #accessing }
GtkCellRenderer >> sensitive: sensitive [

	self ffiCall: #(void gtk_cell_renderer_set_sensitive ( self, gboolean sensitive ))
]

{ #category : #private }
GtkCellRenderer >> setPaddingX: xpad y: ypad [

	^ self ffiCall: #(void gtk_cell_renderer_set_padding ( self, gint xpad, gint ypad ))
]

{ #category : #accessing }
GtkCellRenderer >> width [

	^ self gObjectGetInteger: 'width'
]

{ #category : #accessing }
GtkCellRenderer >> width: aNumber [ 

	self gObjectSet: 'width' toInteger: aNumber
]
