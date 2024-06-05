Class {
	#name : 'GTreeListReferenceStore',
	#superclass : 'GListReferenceStore',
	#instVars : [
		'stores'
	],
	#category : 'GLib-Lists',
	#package : 'GLib',
	#tag : 'Lists'
}

{ #category : 'as yet unclassified' }
GTreeListReferenceStore >> initialize [

	super initialize.
	stores := Dictionary new
]

{ #category : 'as yet unclassified' }
GTreeListReferenceStore >> itemAtHandle: itemHandle children: aBlock [
	| holder storeHandle store item children position |
	
	holder := GObject fromHandleUnreferenced: itemHandle.
	storeHandle := (holder dataAt: 'store').
	store := self storeAt: storeHandle.
	position := (holder dataAt: 'position') asInteger + 1.
	item := store itemAt: position.
	
	children := aBlock value: item.
	children isEmptyOrNil ifFalse: [ 
		^ self pushStore: (self class new
			items: children;
			yourself) ].
		
	^ ExternalAddress null
]

{ #category : 'as yet unclassified' }
GTreeListReferenceStore >> pushStore: aStore [

	stores at: aStore getHandle put: aStore.
	aStore doNotAutoRelease.
	^ aStore
]

{ #category : 'as yet unclassified' }
GTreeListReferenceStore >> storeAt: storeHandle [
	
	^ mutex critical: [ 
		storeHandle = self getHandle 
			ifTrue: [ self ]
			ifFalse: [ stores at: storeHandle ] ]
]
