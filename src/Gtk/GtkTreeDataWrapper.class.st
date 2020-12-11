"
A wrapper for elements to be shown in a list. It keeps the element to show plus an GtkIterPath and their children (also wrapped).
"
Class {
	#name : #GtkTreeDataWrapper,
	#superclass : #Object,
	#instVars : [
		'item',
		'children',
		'path'
	],
	#category : #'Gtk-Widget-Tree-Store'
}

{ #category : #accessing }
GtkTreeDataWrapper >> childAt: aNumber [

	^ children at: aNumber
]

{ #category : #accessing }
GtkTreeDataWrapper >> children [

	^ children
]

{ #category : #initialization }
GtkTreeDataWrapper >> free [

	children ifNotNil: [ 
		children do: [ :each | each free ] ].
	path ifNotNil: [ 
		path free ]
]

{ #category : #testing }
GtkTreeDataWrapper >> hasChildren [

	^ children isEmptyOrNil not
]

{ #category : #accessing }
GtkTreeDataWrapper >> item [

	^ item
]

{ #category : #accessing }
GtkTreeDataWrapper >> item: anObject [

	item := anObject
]

{ #category : #testing }
GtkTreeDataWrapper >> needsChildren [

	^ children isNil
]

{ #category : #accessing }
GtkTreeDataWrapper >> numberOfChildren [

	children ifNil: [ ^ 0 ].
	^ children size
]

{ #category : #accessing }
GtkTreeDataWrapper >> path [

	^ path
]

{ #category : #accessing }
GtkTreeDataWrapper >> path: anArray [

	path := anArray
]

{ #category : #accessing }
GtkTreeDataWrapper >> wrapChildren: anArray [

	children := anArray withIndexCollect: [ :each :index |
		self class new 
			item: each;
			yourself ]
]
