"
A data column that provides the index of the element in the tree view. 
The index will be the first element of the path, hence this property will just work correctly on tables (not trees).
This column will ignore evaluation block (as it does not needs it)
"
Class {
	#name : #GtkTreeDataIndexColumn,
	#superclass : #GtkTreeDataIntegerColumn,
	#category : #'Gtk-Widget-Tree-Store'
}

{ #category : #accessing }
GtkTreeDataIndexColumn >> setValueOf: item path: path to: gValue [

	gValue setInt: path toArray first
]
