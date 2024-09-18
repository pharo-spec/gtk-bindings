"
https://docs.gtk.org/gtk4/class.TreeListModel.html
"
Class {
	#name : 'GtkTreeListModel',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'store'
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
	| row |

	row := self rowAt: position.
	^ [ aBlock value: row ]
	ensure: [ row objectUnref ]
]
