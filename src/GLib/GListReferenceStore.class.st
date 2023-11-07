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

{ #category : 'class initialization' }
GListReferenceStore class >> gDefine: gClass [

	gClass 
		parent: GListStore;
		addInterface: GListModelIface 
			initialize: [ :interface | self gDefineListModelInterface: interface ]
]

{ #category : 'class initialization' }
GListReferenceStore class >> gDefineListModelInterface: iface [

	iface 
		connect: #get_item_type 
			signature:  #(GType (void *list)) 
			to: [ :list | (self gInstance: list) get_item_type ];
		connect: #get_n_items 
			signature: #(guint (void *list))  
			to: [ :list | (self gInstance: list) get_n_items ];
		connect: #get_item 
			signature: #(gpointer (void *list, guint position)) 
			to: [ :list :position | (self gInstance: list) get_item: position ];
		connect: #get_object:  
			signature: #(GObject* (void * list, guint position))  
			to: [ :list :position | (self gInstance: list) get_object: position ];
		connect: #items_changed 
			signature: #(void (void *list, guint position, guint removed, guint added)) 
			to: [ :list :position :removed :added |
				(self gInstanceSafe: list) ifNotNil: [ :instance | 
					instance
						items_changed: position 
						removed: removed 
						added: added ] ]
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
	| mark |

"('get_object: ', position asString) printToStdout."

	position >= self items size
		ifTrue: [ ^ GObject null ].

	"I need to increment the ref count because the otherside will unref it
	 (and I want to keep it). But just it is not just created."
	^ mutex critical: [
		mark := references referenceAt: position.
		(mark wasCreated not 
			and: [ mark object getHandle isNull not ])
			ifTrue: [ mark object objectRef ].
		mark object ]
]

{ #category : 'initialization' }
GListReferenceStore >> initialize [

	super initialize.
	mutex := Mutex new.
	references := GListReferenceContainer new
]

{ #category : 'accessing' }
GListReferenceStore >> itemAt: aPosition [

	aPosition = 0 ifTrue: [ ^ nil ].
	aPosition > self get_n_items ifTrue: [ ^ nil ].

	^ self items at: aPosition
]

{ #category : 'accessing' }
GListReferenceStore >> itemAtHandle: address [

	^ self itemAt: ((GObject fromHandleUnreferenced: address) dataAt: 'position') asInteger + 1
]

{ #category : 'accessing' }
GListReferenceStore >> items [

	^ items
]

{ #category : 'accessing' }
GListReferenceStore >> items: aSequenceableCollection [

	items := aSequenceableCollection copy.
	self reset
]

{ #category : 'accessing - model' }
GListReferenceStore >> items_changed: position removed: removed added: added [

]

{ #category : 'private' }
GListReferenceStore >> reset [
	
	references reset
]
