"
An implementation of `GListStore`/GListModel that receives generic `GObject`. 
Use `GListObjectStore class>>#newType:` to explicit the type of objects that will be returned (needed in some Gtk components)
"
Class {
	#name : 'GListObjectStore',
	#superclass : 'GBaseListStore',
	#traits : 'GTClass',
	#classTraits : 'GTClass classTrait',
	#instVars : [
		'items',
		'type'
	],
	#category : 'GLib-Lists',
	#package : 'GLib',
	#tag : 'Lists'
}

{ #category : 'class initialization' }
GListObjectStore class >> gDefine: gClass [

	gClass 
		parent: GObject;
		addInterface: GListModelIface 
			initialize: [ :interface | self gDefineListModelInterface: interface ]
]

{ #category : 'class initialization' }
GListObjectStore class >> gDefineListModelInterface: iface [

	iface 
		connect: #get_item_type 
			signature:  #(gsize (void *list)) 
			to: [ :list | (self gInstance: list) get_item_type ];
		connect: #get_n_items 
			signature: #(guint (void *list))  
			to: [ :list | (self gInstance: list) get_n_items ];
		connect: #get_item 
			signature: #(gpointer (void *list, guint position)) 
			to: [ :list :position | (self gInstance: list) get_item: position ]
]

{ #category : 'instance creation' }
GListObjectStore class >> newType: gType [

	^ self new
		type: gType;
		yourself
]

{ #category : 'accessing - model' }
GListObjectStore >> get_item: position [

	position >= items size
		ifTrue: [ ^ ExternalAddress null ].

	^ (self get_object: position) getHandle
]

{ #category : 'accessing - model' }
GListObjectStore >> get_item_type [

	^ type ifNil: [ GType G_TYPE_OBJECT ]
]

{ #category : 'accessing - model' }
GListObjectStore >> get_n_items [
	
	^ items size
]

{ #category : 'accessing - model' }
GListObjectStore >> get_object: position [

	position > items size
		ifTrue: [ ^ GObject null ].

	"Apparently, it is required to increment the ref each time because it is expected 
	 the user will take control"
	^ (self itemAt: position + 1)
		objectRef;
		yourself
]

{ #category : 'testing' }
GListObjectStore >> isEmpty [

	^ self items isEmptyOrNil
]

{ #category : 'accessing' }
GListObjectStore >> itemAt: aPosition [

	aPosition = 0 ifTrue: [ ^ nil ].
	aPosition > self items size ifTrue: [ ^ nil ].

	^ self items at: aPosition
]

{ #category : 'accessing' }
GListObjectStore >> itemByHandle: aHandle ifFound: foundBlock ifNone: noneBlock [

	^ self items 
		detect: [ :each | each getHandle = aHandle ]
		ifFound: foundBlock 
		ifNone: noneBlock		
]

{ #category : 'accessing' }
GListObjectStore >> itemByHandle: aHandle ifNone: noneBlock [

	^ self items 
		detect: [ :each | each getHandle = aHandle ]
		ifNone: noneBlock		
]

{ #category : 'accessing' }
GListObjectStore >> items [

	^ items
]

{ #category : 'accessing' }
GListObjectStore >> items: aSequenceableCollection [
	"aSequenceableCollection contains GObject"

	items := aSequenceableCollection.
	self reset
]

{ #category : 'accessing - model' }
GListObjectStore >> items_changed: position removed: removed added: added [

]

{ #category : 'private' }
GListObjectStore >> reset [

]

{ #category : 'initialization' }
GListObjectStore >> type: aType [

	type := aType
]
