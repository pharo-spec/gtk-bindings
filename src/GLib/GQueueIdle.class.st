"
I am a special class made to insert callbacks into the idle action. 
I exist because while running on main thread, gtk will execute gtk_main who will take over the thread. To insert commands, we need to add a call to one of the idle functions (see my implemented methods and senders to it for details)
"
Class {
	#name : 'GQueueIdle',
	#superclass : 'GLibLibrary',
	#instVars : [
		'queue',
		'function',
		'pending',
		'mainContext',
		'processMutex'
	],
	#category : 'GLib-Library',
	#package : 'GLib',
	#tag : 'Library'
}

{ #category : 'private' }
GQueueIdle >> ensureFunction [

	(function isNil or: [ function thunk isNullOrNil ]) ifFalse: [ ^ self ].
	function := self newFunction.
	
	logger trace: function
]

{ #category : 'private' }
GQueueIdle >> ensureMainContext [

	mainContext isNullOrNil ifFalse: [ ^ self ].
	mainContext := GMainContext default.
	
	logger trace: mainContext
]

{ #category : 'private' }
GQueueIdle >> gIdleAddFull: aCallback [

	self ffiCall: #(void g_idle_add_full(
		gint 200 "G_PRIORITY_DEFAULT_IDLE", 
		GCallback aCallback, 
		NULL, 
		NULL))
]

{ #category : 'private' }
GQueueIdle >> gMainContextInvoke: aCallback [

	self ffiCall: #(void g_main_context_invoke_full(
		GMainContext *mainContext, 
		gint 0 "G_PRIORITY_DEFAULT", 
		GCallback aCallback, 
		NULL, 
		NULL))
]

{ #category : 'accessing' }
GQueueIdle >> idleAdd: aBlock [
	
	logger trace: aBlock.

	processMutex critical: [ queue add: aBlock ].
	pending ifFalse: [ 
		self queueIdleAction ]
]

{ #category : 'initialization' }
GQueueIdle >> initialize [ 

	super initialize.
	processMutex := Mutex new.	
	queue := OrderedCollection new: 500.
	pending := false
]

{ #category : 'private' }
GQueueIdle >> invokeAction [

	pending ifTrue: [ ^ self ].
	queue ifEmpty: [ ^ self ].
	pending := true.	
	self ensureFunction.
	self ensureMainContext.
	self gMainContextInvoke: function
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
	| processingQueue |
	
	processMutex critical: [ 
		queue ifEmpty: [ ^ false ].
		processingQueue := queue copy.
		queue removeAll.
		pending := false ].
	 
	logger trace: processingQueue size.
	 
	processingQueue
		do: [ :aBlock | aBlock value ].
		
	"send a wakeup message to the loop to speed up things"
	mainContext wakeup.
	
	^ false
]

{ #category : 'private' }
GQueueIdle >> queueIdleAction [

	pending ifTrue: [ ^ self ].
	queue isEmpty ifTrue: [ ^ self ].
	
	pending := true.
	self ensureMainContext.
	self ensureFunction.
	self gIdleAddFull: function
]

{ #category : 'accessing' }
GQueueIdle >> reset [

	processMutex critical: [ 
		queue removeAll.
		function := nil ]
]

{ #category : 'accessing platform' }
GQueueIdle >> runner [

	^ GtkSameThreadRunner uniqueInstance
]
