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
		get_item_type: (GCallback 
			signature: #(GType (void *list)) 
			block: [ :list | (self gInstance: list) get_item_type ]);
		get_n_items: (GCallback 
			signature: #(guint (void *list))  
			block: [ :list | (self gInstance: list) get_n_items ]);
		get_item: (GCallback 
			signature: #(gpointer (void *list, guint position)) 
			block: [ :list :position | (self gInstance: list) get_item: position ]);
		get_object: (GCallback 
			signature: #(GObject* (void * list, guint position))  
			block: [ :list :position | (self gInstance: list) get_object: position ]);
		items_changed: (GCallback 
			signature: #(void (void *list, guint position, guint removed, guint added)) 
			block: [ :list :position :removed :added |
				(self gInstance: list)
					items_changed: position 
					removed: removed 
					added: added ])
]

{ #category : #'accessing - model' }
GListDataStore >> get_item: position [

	position >= items size
		ifTrue: [ ^ ExternalAddress null ].

	^ (self get_object: position) getHandle
]

{ #category : #'accessing - model' }
GListDataStore >> get_item_type [

	^ GType G_TYPE_OBJECT
]

{ #category : #'accessing - model' }
GListDataStore >> get_n_items [
	
	^ items size
]

{ #category : #'accessing - model' }
GListDataStore >> get_object: position [
	| mark |

	position >= items size
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
