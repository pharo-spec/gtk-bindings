Class {
	#name : #GtkTreeModel,
	#superclass : #GObject,
	#category : #'Gtk-Widget-Tree'
}

{ #category : #'as yet unclassified' }
GtkTreeModel >> getFor: iter column: column to: item [ 

	^ self ffiCall: #(void gtk_tree_model_get (self, GtkTreeIter *iter,  int column, void* item, -1 ))
]
