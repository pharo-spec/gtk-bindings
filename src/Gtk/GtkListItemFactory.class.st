"
https://docs.gtk.org/gtk4/class.ListItemFactory.html
"
Class {
	#name : #GtkListItemFactory,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'storedObjects'
	],
	#category : #'Gtk-Widget-List'
}

{ #category : #initialization }
GtkListItemFactory >> initialize [

	super initialize.
	storedObjects := Dictionary new
]

{ #category : #accessing }
GtkListItemFactory >> objectAtHandle: anAddress [

	^ storedObjects at: anAddress
]

{ #category : #accessing }
GtkListItemFactory >> storeObject: anObject [

	storedObjects
		at: anObject getHandle
		put: anObject.

	^ anObject
]
