"
I am a special class made to insert callbacks into the idle action. 
I exist because while running on main thread, gtk will execute gtk_main who will take over the thread. To insert commands, we need to add a call to one of the idle functions (see my implemented methods and senders to it for details)
"
Class {
	#name : 'GQueueIdle',
	#superclass : 'GLibLibrary',
	#instVars : [
		'mutex',
		'queue',
		'function',
		'processMutex',
		'processing',
		'pending'
	],
	#category : 'GLib-Library',
	#package : 'GLib',
	#tag : 'Library'
}

{ #category : 'private' }
GQueueIdle >> ensureFunction [

	(function isNil or: [ function thunk isNullOrNil ]) ifFalse: [ ^ self ].
	function := self newFunction
]

{ #category : 'private' }
GQueueIdle >> gIdleAddFull: aCallback [

	self ffiCall: #(void g_idle_add_full(
		gint 200 "G_PRIORITY_DEFAULT_IDLE", 
		GCallback aCallback, 
		NULL, 
		NULL))
]

{ #category : 'accessing' }
GQueueIdle >> idleAdd: aBlock [

	mutex critical: [
		processMutex critical: [  
			queue add: aBlock ].
		self queueIdleAction ]
]

{ #category : 'initialization' }
GQueueIdle >> initialize [ 

	super initialize.
	mutex := Mutex new.
	processMutex := Mutex new.	
	queue := OrderedCollection new: 500.
	processing := false.
	pending := false
]

{ #category : 'private' }
GQueueIdle >> newFunction [
	
	^ GSourceFunc new
	 	signature: #(guint (void *data))
		block: [ :data |
			self processQueue
				ifTrue: [ 1 ]
				ifFalse: [ 0 ] ]
]

{ #category : 'private' }
GQueueIdle >> processQueue [
	| processingQueue oldProcessing |
	
	processMutex critical: [ 
		queue ifEmpty: [ ^ self ].
		processingQueue := queue copy.
		queue removeAll.
		pending := false ].
	 
	[
		oldProcessing := processing.  
		processing := true. 
		processingQueue
			do: [ :aBlock | aBlock value ] ] 
	ensure: [ 
		processing := false ].
	
	^ queue isNotEmpty
]

{ #category : 'private' }
GQueueIdle >> queueIdleAction [

	pending ifTrue: [ ^ self ].
	queue isEmpty ifTrue: [ ^ self ].
	processMutex critical: [ pending := true ].
	processing ifFalse: [ 
		self ensureFunction.
		self gIdleAddFull: function ]
]

{ #category : 'accessing' }
GQueueIdle >> reset [

	mutex critical: [ 
		queue removeAll.
		function := nil ]
]

{ #category : 'accessing platform' }
GQueueIdle >> runner [

	^ TFSameThreadRunner uniqueInstance
]
