Class {
	#name : 'GtkTreeModel',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-Tree',
	#package : 'Gtk',
	#tag : 'Widget-Tree'
}

{ #category : 'accessing' }
GtkTreeModel >> getFor: iter column: column to: item [ 

	^ self ffiCall: #(void gtk_tree_model_get (self, GtkTreeIter *iter,  int column, void* item, -1 ))
]
