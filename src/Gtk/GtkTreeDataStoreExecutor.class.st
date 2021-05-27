"
A helper to finalize (dispose) cached elements from *class:GtkTreeDataStore*

See *method:GtkTreeStore#registerForFinalize*
"
Class {
	#name : #GtkTreeDataStoreExecutor,
	#superclass : #Object,
	#instVars : [
		'holder'
	],
	#category : #'Gtk-Widget-Tree-Store'
}

{ #category : #finalization }
GtkTreeDataStoreExecutor >> finalize [

	holder first ifNotNil: [ :h |
		h do: [ :each | each free ] ]
]

{ #category : #accessing }
GtkTreeDataStoreExecutor >> holder [

	^ holder first
]

{ #category : #accessing }
GtkTreeDataStoreExecutor >> holder: anArray [

	holder := WeakArray with: anArray
]
