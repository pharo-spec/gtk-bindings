"
An object that will be used as a mark for an item served by a `GListDataStore` (we transmit pointers to Gtk, but then we need to reference the item in image...
"
Class {
	#name : #GListStoreMarkObject,
	#superclass : #GObject,
	#traits : 'GTClass',
	#classTraits : 'GTClass classTrait',
	#instVars : [
		'position'
	],
	#pools : [
		'GParamFlags'
	],
	#category : #'GLib-Lists'
}

{ #category : #accessing }
GListStoreMarkObject class >> gType [

	^ self gClass type
]

{ #category : #accessing }
GListStoreMarkObject >> position [

	^ position ifNil: [ 0 ]
]

{ #category : #accessing }
GListStoreMarkObject >> position: aNumber [

	position := aNumber
]
