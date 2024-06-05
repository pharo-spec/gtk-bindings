"
Implements a datastore that use instances if `GObject` as reference, setting the data (using `GObject>>#dataAt:put:` with the position of the item element.
This feels more lightway than the mechanism used with GListDataStore, that uses a specially created object.
"
Class {
	#name : 'GListReferenceStore',
	#superclass : 'GListStore',
	#traits : 'GTClass',
	#classTraits : 'GTClass classTrait',
	#instVars : [
		'items',
		'references',
		'mutex'
	],
	#category : 'GLib-Lists',
	#package : 'GLib',
	#tag : 'Lists'
}

{ #category : 'accessing' }
GListReferenceStore class >> gClassSize [

	^ super gClassSize
]

{ #category : 'class initialization' }
GListReferenceStore class >> gDefine: gClass [

	gClass 
		parent: GObject;
		addInterface: GListModelIface 
			initialize: [ :interface | self gDefineListModelInterface: interface ]
]

{ #category : 'class initialization' }
GListReferenceStore class >> gDefineListModelInterface: iface [

	iface 
		connect: #get_item_type 
			signature:  #(GType (void *list)) 
			to: [ :handle | 
				(self gInstanceSafe: handle) 
					ifNotNil: [ :list | list get_item_type ]
					ifNil: [ 0 ] ];
		connect: #get_n_items 
			signature: #(guint (void *list))  
			to: [ :handle | 
				(self gInstanceSafe: handle) 
					ifNotNil: [ :list | list get_n_items ]
					ifNil: [ 0 ] ];
		connect: #get_item 
			signature: #(gpointer (void *list, guint position)) 
			to: [ :handle :position | 
				(self gInstanceSafe: handle) 
					ifNotNil: [ :list | list get_item: position ] 
					ifNil: [ ExternalAddress null ] ]
]

{ #category : 'accessing' }
GListReferenceStore class >> gSize [

	^ super gSize
]

{ #category : 'finalization' }
GListReferenceStore >> finalize [

	self isValidHandle ifFalse: [ ^ self ].
	GRunLoop defer: [ 
		references freeReferences.
		super finalize ]
]

{ #category : 'finalization' }
GListReferenceStore >> finalizedOnGtk [

	references freeReferences
]

{ #category : 'accessing - model' }
GListReferenceStore >> get_item: position [

	position >= self items size
		ifTrue: [ ^ ExternalAddress null ].

	^ (self get_object: position) getHandle
]

{ #category : 'accessing - model' }
GListReferenceStore >> get_item_type [

	^ GObject gType
]

{ #category : 'accessing - model' }
GListReferenceStore >> get_n_items [
	
	^ self items size
]

{ #category : 'accessing - model' }
GListReferenceStore >> get_object: position [

	position >= self items size
		ifTrue: [ ^ GObject null ].

	^ mutex critical: [
		(references referenceAt: position)
			dataAt: 'store' put: self getHandle;
			yourself ]
]

{ #category : 'initialization' }
GListReferenceStore >> initialize [

	super initialize.
	mutex := Mutex new.
	references := self newReferenceContainer
]

{ #category : 'as yet unclassified' }
GListReferenceStore >> itemAt: aPosition [

	aPosition = 0 ifTrue: [ ^ nil ].
	aPosition > self get_n_items ifTrue: [ ^ nil ].

	^ self items at: aPosition
]

{ #category : 'accessing' }
GListReferenceStore >> itemAtHandle: address [

	^ self itemAt: ((GObject fromHandleUnreferenced: address) dataAt: 'position') asInteger + 1
]

{ #category : 'as yet unclassified' }
GListReferenceStore >> items [

	^ items
]

{ #category : 'as yet unclassified' }
GListReferenceStore >> items: aSequenceableCollection [

	items := aSequenceableCollection copy.
	self reset
]

{ #category : 'accessing - model' }
GListReferenceStore >> items_changed: position removed: removed added: added [

]

{ #category : 'as yet unclassified' }
GListReferenceStore >> newReferenceContainer [

	^ GListReferenceContainer new
]

{ #category : 'private' }
GListReferenceStore >> reset [
	
	references reset
]
