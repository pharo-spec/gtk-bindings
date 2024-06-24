"
https://docs.gtk.org/gio/class.ListStore.html
"
Class {
	#name : 'GListStore',
	#superclass : 'GBaseListStore',
	#traits : 'GLibIOTLibrary',
	#classTraits : 'GLibIOTLibrary classTrait',
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
	
	
]

{ #category : 'accessing' }
GListStore >> append: item [
		
	self basicAppend: item.
	item objectUnrefNow
]

{ #category : 'private' }
GListStore >> basicAppend: item [

	^ self ffiCall: #(void g_list_store_append (self, GObject* item))
]

{ #category : 'private' }
GListStore >> basicInsert: item at: position [

	^ self ffiCall: #(void g_list_store_insert (self, guint position, GObject* item))
]

{ #category : 'accessing' }
GListStore >> insert: item at: position [

	self basicInsert: item at: position.
	item objectUnrefNow
]

{ #category : 'accessing' }
GListStore >> removeAll [

	^ self ffiCall: #(void g_list_store_remove_all (self))
]

{ #category : 'accessing' }
GListStore >> removeAt: position [

	self ffiCall: #(void g_list_store_remove (self, guint position))
]
