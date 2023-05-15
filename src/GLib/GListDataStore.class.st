"
Implements a data store who's members live in image.
"
Class {
	#name : #GListDataStore,
	#superclass : #GListStore,
	#traits : 'GTClass',
	#classTraits : 'GTClass classTrait',
	#instVars : [
		'items',
		'references',
		'objects'
	],
	#category : #'GLib-Lists'
}

{ #category : #'class initialization' }
GListDataStore class >> gDefine: gClass [

	gClass 
		parent: GListStore;
		addInterface: GListModelIface 
			initialize: [ :interface | self gDefineListModelInterface: interface ]
]

{ #category : #'class initialization' }
GListDataStore class >> gDefineListModelInterface: iface [

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
				(self gInstance: list)
					items_changed: position 
					removed: removed 
					added: added ]
]

{ #category : #'accessing - model' }
GListDataStore >> get_item: position [

	position >= self items size
		ifTrue: [ ^ ExternalAddress null ].

	^ (self get_object: position) getHandle
]

{ #category : #'accessing - model' }
GListDataStore >> get_item_type [

	^ GType G_TYPE_OBJECT
]

{ #category : #'accessing - model' }
GListDataStore >> get_n_items [
	
	^ self items size
]

{ #category : #'accessing - model' }
GListDataStore >> get_object: position [
	| mark |

	position >= self items size
		ifTrue: [ ^ GObject null ].

	"I need to increment the ref count because the otherside will unref it
	 (and I want to keep it)"
	mark := self markAtPosition: position.
	mark objectRef.

	^ mark
]

{ #category : #accessing }
GListDataStore >> itemAt: aPosition [

	aPosition = 0 ifTrue: [ ^ nil ].
	aPosition > self get_n_items ifTrue: [ ^ nil ].

	^ self items at: aPosition
]

{ #category : #accessing }
GListDataStore >> itemAtHandle: address [

	^ self itemAt: (self markAtHandle: address) position
]

{ #category : #accessing }
GListDataStore >> items [

	^ items
]

{ #category : #accessing }
GListDataStore >> items: aSequenceableCollection [

	items := aSequenceableCollection.
	self reset
]

{ #category : #'accessing - model' }
GListDataStore >> items_changed: position removed: removed added: added [

]

{ #category : #private }
GListDataStore >> markAtHandle: anAddress [

	^ references
		at: anAddress
		ifAbsent: [ nil ]
]

{ #category : #private }
GListDataStore >> markAtPosition: position [
	| holder  |

	holder := objects at: position ifAbsent: [ nil ].
	holder ifNotNil: [ ^ holder ].

	holder :=	 GListStoreMarkObject new
		position: position;
		yourself.

	objects at: position put: holder.
	references at: holder getHandle put: holder.

	^ holder
]

{ #category : #private }
GListDataStore >> reset [

	objects := IdentityDictionary new.
	references := Dictionary new
]
