Class {
	#name : #GListReferenceStore,
	#superclass : #GListStore,
	#traits : 'GTClass',
	#classTraits : 'GTClass classTrait',
	#instVars : [
		'items',
		'objects'
	],
	#category : #'GLib-Lists'
}

{ #category : #'class initialization' }
GListReferenceStore class >> gDefine: gClass [

	gClass 
		parent: GListStore;
		addInterface: GListModelIface 
			initialize: [ :interface | self gDefineListModelInterface: interface ]
]

{ #category : #'class initialization' }
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
				(self gInstance: list)
					items_changed: position 
					removed: removed 
					added: added ]
]

{ #category : #'accessing - model' }
GListReferenceStore >> get_item: position [

	position >= self items size
		ifTrue: [ ^ ExternalAddress null ].

	^ (self get_object: position) getHandle
]

{ #category : #'accessing - model' }
GListReferenceStore >> get_item_type [

	^ GObject gType
]

{ #category : #'accessing - model' }
GListReferenceStore >> get_n_items [
	
	^ self items size
]

{ #category : #'accessing - model' }
GListReferenceStore >> get_object: position [
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
GListReferenceStore >> itemAt: aPosition [

	aPosition = 0 ifTrue: [ ^ nil ].
	aPosition > self get_n_items ifTrue: [ ^ nil ].

	^ self items at: aPosition
]

{ #category : #accessing }
GListReferenceStore >> itemAtHandle: address [

	^ self itemAt: ((GObject fromHandleUnreferenced: address) dataAt: 'position') asInteger + 1
]

{ #category : #accessing }
GListReferenceStore >> items [

	^ items
]

{ #category : #accessing }
GListReferenceStore >> items: aSequenceableCollection [

	items := aSequenceableCollection.
	self reset
]

{ #category : #'accessing - model' }
GListReferenceStore >> items_changed: position removed: removed added: added [

]

{ #category : #private }
GListReferenceStore >> markAtPosition: position [
	| holder  |

	holder := objects at: position ifAbsent: [ nil ].
	holder ifNotNil: [ ^ holder ].

	holder :=	 (GObject basicNew 
			setHandle: (GObject gObjectNew: GObject gType);
			initialize;
			yourself)
		dataAt: 'position' put: (ExternalAddress fromAddress: position);
		yourself.

	objects at: position put: holder.

	^ holder
]

{ #category : #private }
GListReferenceStore >> reset [

	objects := IdentityDictionary new
]