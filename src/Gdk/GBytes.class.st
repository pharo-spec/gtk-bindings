"
https://docs.gtk.org/glib/struct.Bytes.html
"
Class {
	#name : 'GBytes',
	#superclass : 'GBaseObject',
	#traits : 'GLibTLibrary',
	#classTraits : 'GLibTLibrary classTrait',
	#category : 'Gdk-Texture',
	#package : 'Gdk',
	#tag : 'Texture'
}

{ #category : 'finalization' }
GBytes class >> finalizeResourceData: handle [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	(self isValidHandle: handle) ifFalse: [ ^ self ].

	GFinalizeAnnouncement emitTarget: self handle: handle.
	GRunLoop defer: [ self unref: handle ].
	handle beNull
]

{ #category : 'private' }
GBytes class >> gBytesNew: data size: size [

	self ffiCall: #(GBytes* g_bytes_new (gpointer data, gsize size))
]

{ #category : 'private' }
GBytes class >> gBytesNewStatic: data size: size [

	self ffiCall: #(GBytes* g_bytes_new_static (gpointer data, gsize size))
]

{ #category : 'private' }
GBytes class >> gBytesNewTake: data size: size [

	self ffiCall: #(GBytes* g_bytes_new_take (gpointer data, gsize size))
]

{ #category : 'private' }
GBytes class >> gBytesNewWithFreeFunc: data size: size freeFunc: free_func userData: user_data [

	self ffiCall: #(GBytes* g_bytes_new_with_free_func (
		gpointer data, 
		gsize size,
		"GDestroyNotify"GCallback free_func,
		gpointer user_data))
]

{ #category : 'instance creation' }
GBytes class >> newData: data [

	^ self newData: data size: data size
]

{ #category : 'instance creation' }
GBytes class >> newData: data size: size [

	^ (self gBytesNew: data size: size) initialize
]

{ #category : 'instance creation' }
GBytes class >> newData: data size: size freeFunction: aCallback [

	^ (self 
		gBytesNewWithFreeFunc: data 
			size: size 
			freeFunc: aCallback 
			userData: ExternalAddress null) 
		initialize
]

{ #category : 'instance creation' }
GBytes class >> newStaticData: data size: size [

	^ (self gBytesNewStatic: data size: size) initialize
]

{ #category : 'instance creation' }
GBytes class >> newTakeData: data size: size [

	^ (self gBytesNewTake: data size: size) initialize
]

{ #category : 'private' }
GBytes class >> unref: handle [

	self ffiCall: #(void g_bytes_unref (void *handle))
]

{ #category : 'accessing' }
GBytes >> ref [

	self ffiCall: #(GBytes* g_bytes_ref (self))
]

{ #category : 'accessing' }
GBytes >> unref [

	self ffiCall: #(void g_bytes_unref (self))
]
