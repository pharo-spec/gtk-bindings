"
GtkTreeStore
GtkTreeStore — A tree-like data structure that can be used with the GtkTreeView

https://developer.gnome.org/gtk3/stable/GtkTreeStore.html
"
Class {
	#name : 'GtkTreeStore',
	#superclass : 'GtkBaseStore',
	#traits : 'GtkTTreeSortable',
	#classTraits : 'GtkTTreeSortable classTrait',
	#pools : [
		'GType'
	],
	#category : 'Gtk-Widget-Tree-Store',
	#package : 'Gtk',
	#tag : 'Widget-Tree-Store'
}

{ #category : 'private' }
GtkTreeStore class >> basicNewWithNumberOfColumns: aNumber andTypes: anExternalArray [

	^ self 
		gtkTreeStoreNewWithNumberOfColums: aNumber 
		andTypes: anExternalArray
]

{ #category : 'accessing' }
GtkTreeStore class >> gClassSize [
	"hardcoded. I took the size by executing sizeof in a C program"

	^ 168
]

{ #category : 'accessing' }
GtkTreeStore class >> gSize [

	^ 32
]

{ #category : 'accessing' }
GtkTreeStore class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_tree_store_get_type())
]

{ #category : 'private' }
GtkTreeStore class >> gtkTreeStoreNewWithNumberOfColums: numberoOfColumns andTypes: types [

	^ self ffiCall: #(GtkTreeStore * gtk_tree_store_newv (gint numberoOfColumns, oop types))
]

{ #category : 'common' }
GtkTreeStore class >> init: iface [

	^ self ffiCall: #(void gtk_tree_store_tree_model_init (GtkTreeModelIface *iface))
]

{ #category : 'testing' }
GtkTreeStore class >> isDeprecated [

	^ true
]

{ #category : 'iterating' }
GtkTreeStore >> appendNew [
	
	^ (GtkTreeIter on: self) appendNewRoot
]

{ #category : 'private' }
GtkTreeStore >> clear [

	^ self ffiCall: #(void gtk_tree_store_clear(self))
]

{ #category : 'private' }
GtkTreeStore >> getString: buffer column: column iter: iter [
	
	self ffiCall: #(void gtk_tree_model_get (
		self,
		GtkTreeIter *iter,
		gint column,
		void **buffer,
		gint -1))
]

{ #category : 'initialization' }
GtkTreeStore >> initialize [

	self initializeTTreeSortable.
	
	"do not use super initialize to prevent installing of default debug signals causing leaks"
	self isValidHandle ifTrue: [ 
		self autoObjectUnref	]
]

{ #category : 'testing' }
GtkTreeStore >> numberOfColumns [

	^ self ffiCall: #(gint gtk_tree_model_get_n_columns(self))
]

{ #category : 'accessing' }
GtkTreeStore >> stringAt: iter column: columnNumber [
	| buffer |
	
	buffer := ExternalAddress new.
	self getString: buffer column: columnNumber iter: iter.
	^ buffer utf8StringFromCString
]
