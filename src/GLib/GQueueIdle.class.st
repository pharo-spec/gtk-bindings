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
		'processing'
	],
	#category : 'GLib-Library',
	#package : 'GLib',
	#tag : 'Library'
}

{ #category : 'private' }
GQueueIdle >> ensureFunction [

	(function isNil or: [ function thunk isNull ]) ifFalse: [ ^ self ].
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
		self ensureFunction.
		queue nextPut: aBlock.
		self queueIdleAction ]
]

{ #category : 'initialization' }
GQueueIdle >> initialize [ 

	super initialize.
	mutex := Mutex new.
	processMutex := Mutex new.	
	queue := WaitfreeQueue new
]

{ #category : 'private' }
GQueueIdle >> newFunction [
	
	^ GSourceFunc new
	 	signature: #(guint (void *data))
		block: [ :data |
			self processQueue.
			0 ]
]

{ #category : 'private' }
GQueueIdle >> nextQueuedBlock [
	
	^ queue nextOrNil
]

{ #category : 'private' }
GQueueIdle >> processQueue [
	| block |
	
	(block := self nextQueuedBlock) ifNotNil: [
		block value.
		"I need to let the scheduler decide if someone else needs the process"
		Processor yield ].
	"requeue (it there are more blocks). I do not process all blocks in a row because 
	 I need to let GTK to process other internal events (drawing, etc.) before!"
	self queueIdleAction
]

{ #category : 'private' }
GQueueIdle >> queueIdleAction [

	queue isEmpty ifTrue: [ ^ self ].
	self gIdleAddFull: function
]

{ #category : 'accessing' }
GQueueIdle >> reset [

	mutex critical: [ 
		queue removeAll ]
]

{ #category : 'accessing platform' }
GQueueIdle >> runner [

	^ TFSameThreadRunner uniqueInstance
]
