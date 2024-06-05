Class {
	#name : 'GTreeListReferenceContainer',
	#superclass : 'GListReferenceContainer',
	#instVars : [
		'children',
		'paths',
		'roots'
	],
	#category : 'GLib-Lists',
	#package : 'GLib',
	#tag : 'Lists'
}

{ #category : 'instance creation' }
GTreeListReferenceContainer class >> newRoots: aCollection children: aBlock [ 
	
	^ self basicNew 	
		initializeRoots: aCollection children: aBlock;
		yourself
]

{ #category : 'initialization' }
GTreeListReferenceContainer >> initializeRoots: aCollection children: aBlock [ 
	
	self initialize.
	paths := IdentityDictionary new.
	roots := aCollection.
	children := aBlock
]

{ #category : 'accessing' }
GTreeListReferenceContainer >> itemAt: aNumber [ 

	self error
]

{ #category : 'accessing' }
GTreeListReferenceContainer >> itemAtPath: aPath [

	^ self itemAtPath: aPath from: roots
]

{ #category : 'private' }
GTreeListReferenceContainer >> itemAtPath: aPath from: aCollection [ 
	
	aPath size = 1 ifTrue: [ 
		^ aCollection at: aPath first ].
	
	^ self 
		itemAtPath: aPath allButFirst 
		from: (children value: (aCollection at: aPath first))
]

{ #category : 'as yet unclassified' }
GTreeListReferenceContainer >> pathAtPosition: aNumber [
	
	^ paths 
		at: aNumber 
		ifAbsentPut: [ { aNumber } ]
]
