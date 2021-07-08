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
	#classVars : [
		'#Current'
	],
	#pools : [
		'GtkTypes'
	],
	#classInstVars : [
		'#uniqueInstance'
	],
	#category : #'GObject-Base'
}

{ #category : #accessing }
GRunLoop class >> current [
	^ Current ifNil: [ Current := self defaultRunLoopClass uniqueInstance ]
]

{ #category : #accessing }
GRunLoop class >> current: aRunLoop [
	Current ifNotNil: [ Current stop ].
	Current := aRunLoop
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
GRunLoop class >> install [

	self = GRunLoop ifTrue: [ 
		self error: 'I''m an abstract class. You need to install one of my subclasses.' ].
	^ self current: self uniqueInstance
]

{ #category : #'instance creation' }
GRunLoop class >> new [
	^ self error: 'Use #uniqueInstance'
]

{ #category : #accessing }
GRunLoop class >> reset [
	<script>

	self current: nil
]

{ #category : #'instance creation' }
GRunLoop class >> uniqueInstance [
	
	self = GRunLoop 
		ifTrue: [ self error: 'I''m an abstract class. Use one of my children.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
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
