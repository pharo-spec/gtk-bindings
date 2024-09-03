"
A store that can answer other stores. 
Used to traverse trees.
"
Class {
	#name : 'GTreeListReferenceStore',
	#superclass : 'GListReferenceStore',
	#instVars : [
		'stores',
		'index',
		'path'
	],
	#category : 'GLib-Lists',
	#package : 'GLib',
	#tag : 'Lists'
}

{ #category : 'private' }
GTreeListReferenceStore >> index [

	^ index ifNil: [ 0 ]
]

{ #category : 'private' }
GTreeListReferenceStore >> index: aNumber [

	index := aNumber
]

{ #category : 'accessing' }
GTreeListReferenceStore >> itemAtHandle: itemHandle children: aBlock [
	| holder storeHandle store item children position |
	
	holder := GObject fromHandleUnreferenced: itemHandle.
	storeHandle := holder dataAt: 'store'.
	store := self storeAt: storeHandle.
	position := (holder dataAt: 'position') asInteger + 1.
	item := store itemAt: position.
	
	children := aBlock value: item.
	children isEmptyOrNil ifFalse: [ 
		^ self pushStore: (self class new
			items: children;
			path: (store path copyWith: position);
			yourself) ].

	^ ExternalAddress null
]

{ #category : 'private' }
GTreeListReferenceStore >> path [

	^ path ifNil: [ #() ]
]

{ #category : 'private' }
GTreeListReferenceStore >> path: aPath [

	path := aPath
]

{ #category : 'accessing' }
GTreeListReferenceStore >> pathOfItem: aGObject [
	| store |
	
	store := self storeAt: (aGObject dataAt: 'store') asInteger.
	^ store path copyWith: (aGObject dataAt: 'position') asInteger + 1
]

{ #category : 'private' }
GTreeListReferenceStore >> pushStore: aStore [

	stores ifNil: [ stores := OrderedCollection new ].
	stores add: aStore.
	aStore index: stores size.
	aStore doNotAutoRelease.
	
	^ aStore
]

{ #category : 'private' }
GTreeListReferenceStore >> referenceAt: position [ 

	^ (super referenceAt: position) 
		dataAt: 'store' put: (ExternalAddress fromAddress: self index);
		yourself
]

{ #category : 'accessing' }
GTreeListReferenceStore >> storeAt: storeHandle [
	| storeIndex |

	storeIndex := storeHandle asInteger.
	^ storeIndex = 0
		ifTrue: [ self ]
		ifFalse: [ stores at: storeIndex ]
]
