"
A base run loop for gtk applications.
I define the base behaviour of a run loop: 

- start/stop 
- event processing

Abstract class, the user need to refer to children for concrete implementations.
"
Class {
	#name : #GRunLoop,
	#superclass : #Object,
	#traits : 'GObjectTLibrary',
	#classTraits : 'GObjectTLibrary classTrait',
	#instVars : [
		'#session',
		'#running',
		'#inCallback => ProcessLocalSlot'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'GObject-Base'
}

{ #category : #accessing }
GRunLoop class >> current [

	^ GtkEngine current runLoop
]

{ #category : #private }
GRunLoop class >> defaultRunLoopClass [

	^ self subclassResponsibility
]

{ #category : #deferring }
GRunLoop class >> defer: aBlock [

	^ self current defer: aBlock
]

{ #category : #deferring }
GRunLoop class >> delayedDefer: aBlock [ 

	self defer: [ 
		[ 
			20 timesRepeat: [ Processor yield. ].
			aBlock value ] fork ]
]

{ #category : #deferring }
GRunLoop class >> forceDefer: aBlock [

	^ self current forceDefer: aBlock
]

{ #category : #accessing }
GRunLoop >> callbackEnter [

	inCallback := true
]

{ #category : #accessing }
GRunLoop >> callerProcess [

	^ self subclassResponsibility
]

{ #category : #private }
GRunLoop >> checkSession [

	^ session == Smalltalk session
]

{ #category : #deferring }
GRunLoop >> defer: aBlock [

	^ aBlock value
]

{ #category : #deferring }
GRunLoop >> forceDefer: aBlock [

	self subclassResponsibility
]

{ #category : #initialization }
GRunLoop >> initialize [
	
	self class initializeSlots: self. 
	running := false.
	super initialize
]

{ #category : #'private installing' }
GRunLoop >> installRunLoop [

	self subclassResponsibility
]

{ #category : #accessing }
GRunLoop >> isDeferring [

	^ false
]

{ #category : #testing }
GRunLoop >> isInCallback [

	^ inCallback == true
]

{ #category : #testing }
GRunLoop >> isRunning [

	^ running
]

{ #category : #accessing }
GRunLoop >> naturalRunner [
	"Answer the 'natural' FFI client to run Gtk."

	^ TFSameThreadRunner uniqueInstance
]

{ #category : #running }
GRunLoop >> spawnNewRunLoop [

	^ self subclassResponsibility
]

{ #category : #running }
GRunLoop >> start [

	self isRunning ifTrue: [ ^ self ].
	
	session := Smalltalk session. 
	running := true.
	self installRunLoop
]

{ #category : #running }
GRunLoop >> stop [ 

	self isRunning ifFalse: [ ^ self ].
	self uninstallRunLoop.	
	running := false
]

{ #category : #'private installing' }
GRunLoop >> uninstallRunLoop [

	self subclassResponsibility
]
