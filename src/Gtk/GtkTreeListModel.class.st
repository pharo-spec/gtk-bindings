"
https://docs.gtk.org/gtk4/class.TreeListModel.html
"
Class {
	#name : 'GtkTreeListModel',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary + GTListModel',
	#classTraits : 'GtkTLibrary classTrait + GTListModel classTrait',
	#instVars : [
		'store',
		'model'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkTreeListModel class >> gtkTreeListModelNew: root passthrough: passthrough autoexpand: autoexpand createFunction: create_func [

	self ffiCall: #(GtkTreeListModel* gtk_tree_list_model_new (
		GListModel* root,
  		gboolean passthrough,
  		gboolean autoexpand,
  		"GtkTreeListModelCreateModelFunc"GCallback create_func,
  		NULL,
  		NULL))
]

{ #category : 'instance creation' }
GtkTreeListModel class >> newRootModel: store [

	^ self 
		newRootModel: store 
		children: [ :item | ExternalAddress null ]
]

{ #category : 'instance creation' }
GtkTreeListModel class >> newRootModel: store children: aBlock [
	| func instance |	

	func := GCallback 
		signature: #(void *(void *item, gpointer user_data)) 
		block: [ :item :user_data | 
			aBlock value: item].
		
	instance := self 
		gtkTreeListModelNew: store 
		passthrough: false 
		autoexpand: false
		createFunction: func.
	instance initializeRootModel: store function: func.

	^ instance
]

{ #category : 'private' }
GtkTreeListModel >> getModel [

	^ self ffiCall: #(GListModel* gtk_tree_list_model_get_model (self))

]

{ #category : 'initialization' }
GtkTreeListModel >> initializeRootModel: aStore function: aFunction [

	self initialize.
	self keepStore: aStore.
	self registerCallback: aFunction
]

{ #category : 'private' }
GtkTreeListModel >> keepStore: aStore [
	
	store := aStore.
	store doNotAutoRelease
]

{ #category : 'accessing' }
GtkTreeListModel >> model [

	^ model ifNil: [ model := self getModel ]
]

{ #category : 'accessing' }
GtkTreeListModel >> rowAt: position [
	"The caller of the method takes ownership of the returned data, and is responsible for freeing it.
	 better use withRowAt:do:"

	^ self ffiCall: #(GtkTreeListRow* gtk_tree_list_model_get_row (self, guint position))
]

{ #category : 'accessing' }
GtkTreeListModel >> store [

	^ store
]

{ #category : 'accessing' }
GtkTreeListModel >> withRowAt: position do: aBlock [
	"this algoritm if not very nice looking, but is the most effective I have found. 
	 selecting a path is increasingly costly because I need to iterate by all rows 
	 displayed (as there is no separation between roots and children once shown).
	 Only way to know then of this is a root is asking for row depth (1 = root)"
	| row rootPosition |

	"position is zero based"
	rootPosition := -1.
	0 to: self numberOfItems - 1 do: [ :index |
		row := self rowAt: index.
		((row depth = 1) )
			ifTrue: [ rootPosition := rootPosition + 1 ].
			
		rootPosition = position ifTrue: [ 
			"found, execute and exit"
			^ [ aBlock value: row ]
			  ensure: [ row objectUnref ] ].
		
		row objectUnref ].

]
