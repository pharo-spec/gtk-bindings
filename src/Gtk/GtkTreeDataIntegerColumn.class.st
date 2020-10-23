"
A data column that provides an integer
"
Class {
	#name : #GtkTreeDataIntegerColumn,
	#superclass : #GtkTreeDataColumn,
	#category : #'Gtk-Widget-Tree-Store'
}

{ #category : #accessing }
GtkTreeDataIntegerColumn >> gType [

	^ GType G_TYPE_INT
]

{ #category : #accessing }
GtkTreeDataIntegerColumn >> setValueOf: item to: gValue [

	gValue setInt: (self readObject: item)
]
