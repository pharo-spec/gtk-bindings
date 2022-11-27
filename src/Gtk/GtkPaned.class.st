"
A widget with two panes, arranged either horizontally or vertically.

https://docs.gtk.org/gtk4/class.Paned.html
"
Class {
	#name : #GtkPaned,
	#superclass : #GtkWidget,
	#traits : 'GtkTContainer - {#removeAll. #remove:. #basicRemove:. #keepWidget:. #initializeTContainer}',
	#classTraits : 'GtkTContainer classTrait',
	#instVars : [
		'endChild',
		'startChild'
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

{ #category : #accessing }
GtkPaned >> children [ 
	
	children := OrderedCollection new.
	startChild ifNotNil: [ children add: startChild ].
	endChild ifNotNil: [ children add: endChild ].
	^ children	

]

{ #category : #accessing }
GtkPaned >> endChild: child [

	endChild := child.
	self setEndChild: child
]

{ #category : #accessing }
GtkPaned >> endChild: child resize: resize shrink: shrink [ 

	self endChild: child.
	self endResize: resize.
	self endShrink: shrink 
]

{ #category : #accessing }
GtkPaned >> endResize: aBoolean [

	self ffiCall: #(void gtk_paned_set_resize_end_child (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkPaned >> endShrink: aBoolean [

	self ffiCall: #(void gtk_paned_set_shrink_end_child (self, gboolean aBoolean))
]

{ #category : #initialization }
GtkPaned >> initialize [

	super initialize
]

{ #category : #testing }
GtkPaned >> isEndChildResize [

	^ self ffiCall: #(gboolean gtk_paned_get_resize_end_child (self))
]

{ #category : #testing }
GtkPaned >> isEndChildShrink [

	^ self ffiCall: #(gboolean gtk_paned_get_shrink_end_child (self))
]

{ #category : #testing }
GtkPaned >> isStartChildResize [

	^ self ffiCall: #(gboolean gtk_paned_get_resize_start_child (self))
]

{ #category : #testing }
GtkPaned >> isStartChildShrink [

	^ self ffiCall: #(gboolean gtk_paned_get_shrink_start_child (self))
]

{ #category : #accessing }
GtkPaned >> pack1: child [

	self 
		deprecated: #Gtk4 
		transformWith: '`@receiver pack1: `@arg1' -> '`@receiver startChild: `@arg1'.
	self startChild: child
]

{ #category : #accessing }
GtkPaned >> pack1: child resize: resize shrink: shrink [ 

	self 
		deprecated: #Gtk4 
		transformWith: 
			   '`@receiver pack1: `@arg1 resize: `@arg2 shrink: `@arg3' 
			-> '`@receiver startChild: `@arg1 resize: `@arg2 shrink: `@arg3'.

	^ self 
		startChild: child 
		resize: resize 
		shrink: shrink
]

{ #category : #accessing }
GtkPaned >> pack2: child [

	self 
		deprecated: #Gtk4 
		transformWith: '`@receiver pack2: `@arg1' -> '`@receiver endChild: `@arg1'.

	^ self 
		pack2: child 
		resize: true 
		shrink: true
]

{ #category : #accessing }
GtkPaned >> pack2: child resize: resize shrink: shrink [ 

	self 
		deprecated: #Gtk4 
		transformWith: 
			   '`@receiver pack1: `@arg1 resize: `@arg2 shrink: `@arg3' 
			-> '`@receiver startChild: `@arg1 resize: `@arg2 shrink: `@arg3'.

	^ self 
		endChild: child 
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

{ #category : #private }
GtkPaned >> setEndChild: child [

	self ffiCall: #(void gtk_paned_set_end_child (self, GtkWidget* child))
]

{ #category : #private }
GtkPaned >> setStartChild: child [

	self ffiCall: #(void gtk_paned_set_start_child (self, GtkWidget* child))
]

{ #category : #accessing }
GtkPaned >> startChild: child [

	startChild := child.
	self setStartChild: child
]

{ #category : #accessing }
GtkPaned >> startChild: child resize: resize shrink: shrink [ 

	self startChild: child.
	self startResize: resize.
	self startShrink: shrink

]

{ #category : #accessing }
GtkPaned >> startResize: aBoolean [

	self ffiCall: #(void gtk_paned_set_resize_start_child (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkPaned >> startShrink: aBoolean [

	self ffiCall: #(void gtk_paned_set_shrink_start_child (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkPaned >> wideHandle: aBoolean [

	self gObjectSet: 'wide-handle' toBoolean: aBoolean
]
