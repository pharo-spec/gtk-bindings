Class {
	#name : 'GPtrArray',
	#superclass : 'GBaseObject',
	#traits : 'GLibTLibrary',
	#classTraits : 'GLibTLibrary classTrait',
	#category : 'GLib-Misc',
	#package : 'GLib',
	#tag : 'Misc'
}

{ #category : 'instance creation' }
GPtrArray class >> fromArrayOfAddresses: anArray [
	| array |

	array := self newSize: anArray size.
	1 to: anArray size do: [ :index |
	 	array 
			at: (index - 1) 
			put: (anArray at: index) ].
	
	^ array
]

{ #category : 'instance creation' }
GPtrArray class >> fromArrayOfIntegers: anArray [

	^ self fromArrayOfAddresses: (anArray collect: [ :each | ExternalAddress fromAddress: each ])
]

{ #category : 'private' }
GPtrArray class >> gtkNew [

	^ self ffiCall: #(GPtrArray* g_ptr_array_new (void))
]

{ #category : 'private' }
GPtrArray class >> gtkNewFull: reserved_size [

	^ self ffiCall: #(GPtrArray* g_ptr_array_new_full (
		guint reserved_size,
		"GDestroyNotify element_free_func"NULL))
]

{ #category : 'instance creation' }
GPtrArray class >> new [

	^ self gtkNew initialize
]

{ #category : 'instance creation' }
GPtrArray class >> newSize: aNumber [

	^ (self gtkNewFull: aNumber) initialize
]

{ #category : 'converting' }
GPtrArray >> asArray [

	^ Array streamContents: [ :stream |
		self do: [ :each | stream nextPut: each ] ]
]

{ #category : 'accessing' }
GPtrArray >> at: index put: address [ 

	self insertAt: index value: address
]

{ #category : 'as yet unclassified' }
GPtrArray >> do: aBlock [
	| callback |
	
	callback := GCallback 
		signature: #(void (void *data, gpointer user_data)) 
		block: [ :data :user_data | 
			aBlock value: data ].
	
	self foreach: callback	
		
	
]

{ #category : 'as yet unclassified' }
GPtrArray >> finalize [

	self isValidHandle ifFalse: [ ^ self ].
	self unref.
	handle beNull
]

{ #category : 'private' }
GPtrArray >> foreach: func [
	
	^ self ffiCall: #(void g_ptr_array_foreach (
  		self,
  		GCallback func,
  		NULL))
]

{ #category : 'accessing' }
GPtrArray >> insertAt: index value: data [

	^ self ffiCall: #(GPtrArray* g_ptr_array_insert (
		self,
		guint index,
		gpointer data))
]

{ #category : 'private' }
GPtrArray >> unref [

	self ffiCall: #(void g_ptr_array_unref (self))
]
