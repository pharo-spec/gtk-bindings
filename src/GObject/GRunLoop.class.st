"
A base run loop for gtk applications.
I define the base behaviour of a run loop: 

- start/stop 
- event processing

Abstract class, the user need to refer to children for concrete implementations.
"
Class {
	#name : 'GRunLoop',
	#superclass : 'Object',
	#traits : 'GObjectTLibrary',
	#classTraits : 'GObjectTLibrary classTrait',
	#instVars : [
		'#session',
		'#running',
		'#inCallback => ProcessLocalSlot'
	],
	#pools : [
		'GObjectTypes'
	],
	#category : 'GObject-Base',
	#package : 'GObject',
	#tag : 'Base'
}

{ #category : 'accessing' }
GRunLoop class >> current [

	^ GEngine current runLoop
]

{ #category : 'deferring - gtk' }
GRunLoop class >> defer: aBlock [

	^ self current defer: aBlock
]

{ #category : 'deferring - gtk' }
GRunLoop class >> delayedDefer: aBlock [ 

	self defer: [ 
		[ 
			20 timesRepeat: [ Processor yield. ].
			aBlock value ] fork ]
]

{ #category : 'deferring - system' }
GRunLoop class >> enterSystem: aBlock [
	"Execute in system"
	
	self current enterSystem: aBlock
]

{ #category : 'deferring - gtk' }
GRunLoop class >> forceDefer: aBlock [

	^ self current forceDefer: aBlock
]

{ #category : 'accessing' }
GRunLoop >> callbackEnter [

	inCallback := true
]

{ #category : 'accessing' }
GRunLoop >> callbackLeave [

	inCallback := false
]

{ #category : 'accessing' }
GRunLoop >> callerProcess [

	^ self subclassResponsibility
]

{ #category : 'private' }
GRunLoop >> checkSession [

	^ session == Smalltalk session
]

{ #category : 'deferring - gtk' }
GRunLoop >> defer: aBlock [

	^ aBlock value
]

{ #category : 'deferring - system' }
GRunLoop >> enterSystem: aBlock [
	"To keep the graphical backend working smoothly, I need to 'escape' as soon as possible 
	 from each callback gtk will send me (because gtk will wait until the callback returns). 
	 This escape, however, needs to be executed sequentially, hence the usage of a worker."

	"systemWorker isBusy crTrace.
	aBlock crTrace."  
	aBlock fork
]

{ #category : 'deferring - gtk' }
GRunLoop >> forceDefer: aBlock [

	self subclassResponsibility
]

{ #category : 'initialization' }
GRunLoop >> initialize [
	
	self class initializeSlots: self. 
	running := false.
	super initialize
]

{ #category : 'private - installing' }
GRunLoop >> installRunLoop [

	self subclassResponsibility
]

{ #category : 'accessing' }
GRunLoop >> isDeferring [

	^ false
]

{ #category : 'testing' }
GRunLoop >> isInCallback [

	^ inCallback == true
]

{ #category : 'testing' }
GRunLoop >> isRunning [

	^ running
]

{ #category : 'accessing' }
GRunLoop >> naturalRunner [
	"Answer the 'natural' FFI client to run Gtk."

	^ TFSameThreadRunner uniqueInstance
]

{ #category : 'running' }
GRunLoop >> spawnNewRunLoop [

	^ self subclassResponsibility
]

{ #category : 'running' }
GRunLoop >> start [

	self isRunning ifTrue: [ ^ self ].
	
	session := Smalltalk session. 
	"I need to declare the event loop running before install it because otherwise
	 the forked process will finish before we do anything ;)"
	running := true.
	self installRunLoop
]

{ #category : 'running' }
GRunLoop >> stop [ 

	self isRunning ifFalse: [ ^ self ].
	self uninstallRunLoop.	
	running := false
]

{ #category : 'private - installing' }
GRunLoop >> uninstallRunLoop [

	self subclassResponsibility
]
