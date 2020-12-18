"
! GtkTreeDataPixbufColumn

A data column that provides a String.
"
Class {
	#name : #GtkTreeDataStringColumn,
	#superclass : #GtkTreeDataColumn,
	#category : #'Gtk-Widget-Tree-Store'
}

{ #category : #accessing }
GtkTreeDataStringColumn >> gType [

	^ GType G_TYPE_STRING
]

{ #category : #accessing }
GtkTreeDataStringColumn >> setValueOf: item path: path to: gValue [

	gValue setString: (self readObject: item) asString
]
