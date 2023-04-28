"
https://docs.gtk.org/gio/class.SimpleAsyncResult.html
"
Class {
	#name : #GSimpleAsyncResult,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
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
		GCallback callback,
		NULL,
		NULL))
]

{ #category : #private }
GSimpleAsyncResult class >> gNew: source_object callbackHandle: anAddress [

	self ffiCall: #(GSimpleAsyncResult* g_simple_async_result_new (
		GObject *source_object,
		void *anAddress,
		NULL,
		NULL))
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
