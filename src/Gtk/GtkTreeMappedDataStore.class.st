Class {
	#name : #GtkTreeMappedDataStore,
	#superclass : #GtkTreeDataStore,
	#category : #'Gtk-Widget-Tree-Store'
}

{ #category : #initialization }
GtkTreeMappedDataStore >> newColumns [
	
	^ SmallDictionary new
]
