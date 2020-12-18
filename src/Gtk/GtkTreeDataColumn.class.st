"
! GtkTreeDataColumn

A base class for data store columns. 
Used as part of a *class:GtkTreeDataStore*, a column will set a cell value by transforming the model object and pass its result.
"
Class {
	#name : #GtkTreeDataColumn,
	#superclass : #Object,
	#instVars : [
		'column',
		'tag',
		'evaluation',
		'store'
	],
	#category : #'Gtk-Widget-Tree-Store'
}

{ #category : #'instance creation' }
GtkTreeDataColumn class >> evaluated: aBlock [ 

	^ self new evaluated: aBlock
]

{ #category : #'instance creation' }
GtkTreeDataColumn class >> on: aTableColumn [

	^ self new 
		column: aTableColumn;
		evaluated: aTableColumn evaluation;
		yourself
]

{ #category : #accessing }
GtkTreeDataColumn >> column [

	^ column
]

{ #category : #accessing }
GtkTreeDataColumn >> column: aTableColumn [

	column := aTableColumn
]

{ #category : #accessing }
GtkTreeDataColumn >> evaluated: aValuable [
	"Define the transformation applied to the DataStore model object.
	[[[language=Smalltalk
	aColumn evaluated: [ :anObject | anObject asString ]
	]]]"

	evaluation := aValuable
]

{ #category : #accessing }
GtkTreeDataColumn >> gType [
	"Answer the GType of the column."

	^ self subclassResponsibility
]

{ #category : #private }
GtkTreeDataColumn >> readObject: anObject [ 

	^ evaluation cull: anObject
]

{ #category : #accessing }
GtkTreeDataColumn >> setValueOf: item path: path to: gValue [
	"Set the result of ==evaluation== transformation into ==gValue==. 
	 When the gValue arrives, it is already initialised to receive the correct gType."

	self subclassResponsibility
]

{ #category : #accessing }
GtkTreeDataColumn >> store [
	^ store
]

{ #category : #accessing }
GtkTreeDataColumn >> store: anObject [
	store := anObject
]

{ #category : #accessing }
GtkTreeDataColumn >> tag [

	^ tag
]

{ #category : #accessing }
GtkTreeDataColumn >> tag: anObject [

	tag := anObject
]
