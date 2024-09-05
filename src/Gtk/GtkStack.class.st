"
GtkStack
GtkStack — A stacking container

https://developer.gnome.org/gtk3/stable/GtkStack.html
"
Class {
	#name : 'GtkStack',
	#superclass : 'GtkContainer',
	#traits : 'GtkTContainer',
	#classTraits : 'GtkTContainer classTrait',
	#category : 'Gtk-Widget-Container',
	#package : 'Gtk',
	#tag : 'Widget-Container'
}

{ #category : 'accessing' }
GtkStack class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_stack_get_type())
]

{ #category : 'private' }
GtkStack class >> gtkStackNew [

	^ self ffiCall: #(GtkStack *gtk_stack_new (void))
]

{ #category : 'instance creation' }
GtkStack class >> new [
	^ self gtkStackNew initialize 
]

{ #category : 'accessing' }
GtkStack >> addChild: child [

	self keepWidget: child.
	self basicAddChild: child
]

{ #category : 'accessing' }
GtkStack >> addChild: child name: aName [

	self keepWidget: child.
	self basicAddChild: child named: aName
]

{ #category : 'accessing' }
GtkStack >> addChild: child name: aName title: aTitle [

	self keepWidget: child.
	self 
		basicAddChild: child 
		named: aName
		titled: aTitle
]

{ #category : 'accessing' }
GtkStack >> addChild: child title: aTitle [

	self 
		addChild: child 
		name: aTitle 
		title: aTitle
]

{ #category : 'private' }
GtkStack >> basicAddChild: child [

	^ self ffiCall: #(void gtk_stack_add_child (self, GtkWidget *child))
]

{ #category : 'private' }
GtkStack >> basicAddChild: child named: utf8EncodedName [

	^ self ffiCall: #(void gtk_stack_add_named (self, GtkWidget *child, String utf8EncodedName))
]

{ #category : 'private' }
GtkStack >> basicAddChild: child named: utf8EncodedName titled: utf8EncodedTitle [

	^ self ffiCall: #(void gtk_stack_add_titled (self, GtkWidget *child, String utf8EncodedName, String utf8EncodedTitle))
]

{ #category : 'private' }
GtkStack >> basicRemove: child [

	self ffiCall: #(void gtk_stack_remove (self, GtkWidget* child))
]

{ #category : 'initialization' }
GtkStack >> initialize [

	super initialize.
	self initializeTContainer
]
