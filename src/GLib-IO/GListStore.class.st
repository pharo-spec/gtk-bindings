"
https://docs.gtk.org/gio/class.ListStore.html
"
Class {
	#name : 'GListStore',
	#superclass : 'GBaseListStore',
	#traits : 'GLibIOTLibrary',
	#classTraits : 'GLibIOTLibrary classTrait',
	#instVars : [
		'items'
	],
	#category : 'GLib-IO-Misc',
	#package : 'GLib-IO',
	#tag : 'Misc'
}

{ #category : 'private' }
GListStore class >> gtkNewType: item_type [

	^ self ffiCall: #(GListStore* g_list_store_new ("GType"gsize item_type))
]

{ #category : 'instance creation' }
GListStore class >> new [

	^ self gtkNewType: GObject gType
]

{ #category : 'instance creation' }
GListStore class >> newType: aClass [

	^ (self gtkNewType: aClass gType) initialize
]

{ #category : 'instance creation' }
GListStore class >> newType: aClass streamContents: aBlock [
	| instance |
	
	instance := self newType: aClass.
	aBlock value: instance.
	^ instance
]

{ #category : 'accessing' }
GListStore >> append: item [
		
	items add: item.
	self basicAppend: item.
	"appending will take a reference so we can free it here"
	item objectUnrefNow
]

{ #category : 'accessing' }
GListStore >> appendAll: aCollection [

	aCollection do: [ :each | self append: each ]
]

{ #category : 'initialization' }
GListStore >> autoObjectUnref [
	
	"I do not want to auto-object unref, I need to evaluate careful when I can release it 
	 and when don't, but it seems that most of the time, I will not release myself (or I 
	 need to do it directly)."
]

{ #category : 'private' }
GListStore >> basicAppend: item [

	^ self ffiCall: #(void g_list_store_append (self, GObject* item))
]

{ #category : 'private' }
GListStore >> basicInsert: item at: position [

	^ self ffiCall: #(void g_list_store_insert (self, guint position, GObject* item))
]

{ #category : 'private' }
GListStore >> basicRemoveAll [

	^ self ffiCall: #(void g_list_store_remove_all (self))
]

{ #category : 'private' }
GListStore >> basicRemoveAt: position [

	self ffiCall: #(void g_list_store_remove (self, guint position))
]

{ #category : 'initialization' }
GListStore >> initialize [

	super initialize.
	items := OrderedCollection new
]

{ #category : 'accessing' }
GListStore >> insert: item at: position [

	items add: item beforeIndex: position.
	self basicInsert: item at: position - 1.
	"inserting will take a reference so we can free it here"
	item objectUnrefNow
]

{ #category : 'accessing' }
GListStore >> itemByHandle: aHandle ifFound: foundBlock ifNone: noneBlock [

	^ self items 
		detect: [ :each | each getHandle = aHandle ]
		ifFound: foundBlock 
		ifNone: noneBlock
]

{ #category : 'accessing' }
GListStore >> itemByHandle: aHandle ifNone: noneBlock [

	^ self items 
		detect: [ :each | each getHandle = aHandle ]
		ifNone: noneBlock		
]

{ #category : 'accessing' }
GListStore >> items [

	^ items
]

{ #category : 'streaming' }
GListStore >> nextPut: aGObject [

	self append: aGObject
]

{ #category : 'streaming' }
GListStore >> nextPutAll: aCollection [

	aCollection do: [ :each | self nextPut: each ]
]

{ #category : 'accessing' }
GListStore >> removeAll [

	items removeAll.
	self basicRemoveAll
]

{ #category : 'accessing' }
GListStore >> removeAt: position [

	items removeAt: position.
	self basicRemoveAt: position - 1
]
