"
https://docs.gtk.org/gtk4/class.ListItemFactory.html
"
Class {
	#name : 'GtkListItemFactory',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'storedObjects'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'accessing' }
GtkListItemFactory class >> gClassSize [
	"this object structure: is in GtkListItemFactoryClass"
	^ GtkListItemFactoryClass structureSize 
]

{ #category : 'accessing' }
GtkListItemFactory class >> gSize [
	"the object has same size as a GObject, it seems"

	^ super gSize
]

{ #category : 'accessing' }
GtkListItemFactory class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_list_item_factory_get_type())
]

{ #category : 'initialization' }
GtkListItemFactory >> initialize [

	super initialize.
	storedObjects := Dictionary new
]

{ #category : 'accessing' }
GtkListItemFactory >> objectAtHandle: anAddress [

	^ storedObjects at: anAddress
]

{ #category : 'accessing' }
GtkListItemFactory >> storeObject: anObject [

	storedObjects
		at: anObject getHandle
		put: anObject.

	^ anObject
]
