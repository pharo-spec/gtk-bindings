"
https://docs.gtk.org/gio/class.SimpleAsyncResult.html
"
Class {
	#name : #GSimpleAsyncResult,
	#superclass : #GObject,
	#traits : 'GLibTLibrary',
	#classTraits : 'GLibTLibrary classTrait',
	#instVars : [
		'gObject',
		'callback'
	],
	#category : #'GLib-Misc'
}

{ #category : #private }
GSimpleAsyncResult class >> gNew: source_object callback: callback [ 

	self ffiCall: #(GSimpleAsyncResult* g_simple_async_result_new (
		GObject* source_object,
		"GAsyncReadyCallback"GCallback callback,
		"gpointer user_data"NULL,
		"gpointer source_tag"NULL))
]

{ #category : #private }
GSimpleAsyncResult class >> gNew: source_object callbackHandle: anAddress [ 

	self ffiCall: #(GSimpleAsyncResult* g_simple_async_result_new (
		GObject *source_object,
		"GAsyncReadyCallback"void *anAddress,
		"gpointer user_data"NULL,
		"gpointer source_tag"NULL))
]

{ #category : #'instance creation' }
GSimpleAsyncResult class >> newObject: aGObject callback: aCallback [

	^  (self gNew: aGObject callback: aCallback) 
		initializeObject: aGObject callback: aCallback;
		yourself
]

{ #category : #'instance creation' }
GSimpleAsyncResult class >> newObject: aGObject callbackHandle: anAddress [

	^  (self gNew: aGObject callbackHandle: anAddress) 
		initializeObject: aGObject callback: nil;
		yourself
]

{ #category : #initialization }
GSimpleAsyncResult >> initializeObject: aGObject callback: aCallback [
		
	gObject := aGObject.
	callback := aCallback.
	self initialize
]