"
https://docs.gtk.org/gtk4/class.ListItemFactory.html
"
Class {
	#name : #GtkListItemFactory,
	#superclass : #GObject,
	#instVars : [
		'storedObjects'
	],
	#category : #'Gtk4-List'
}

{ #category : #initialization }
GtkListItemFactory >> initialize [

	super initialize.
	storedObjects := Dictionary new
]

{ #category : #'as yet unclassified' }
GtkListItemFactory >> objectAtHandle: anAddress [

	^ storedObjects at: anAddress
]

{ #category : #'as yet unclassified' }
GtkListItemFactory >> storeObject: anObject [

	storedObjects 
		at: anObject getHandle 
		put: anObject.
	^ anObject
]
