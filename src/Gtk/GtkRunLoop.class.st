"
Event loop for Gtk4
"
Class {
	#name : 'GtkRunLoop',
	#superclass : 'GRunLoop',
	#instVars : [
		'callerProcess',
		'context',
		'runProcess',
		'mutex'
	],
	#category : 'Gtk-Application',
	#package : 'Gtk',
	#tag : 'Application'
}

{ #category : 'accessing' }
GtkRunLoop >> callbackEnter [

	TFProcessLocalWorker worker: self naturalRunner.
	super callbackEnter
]

{ #category : 'accessing' }
GtkRunLoop >> callerProcess [

	^ callerProcess
]

{ #category : 'deferring - gtk' }
GtkRunLoop >> defer: aBlock [

	^ self isInCallback
		ifTrue: [ aBlock value ]
		ifFalse: [ self forceDefer: aBlock ]
]

{ #category : 'deferring - system' }
GtkRunLoop >> enterSystem: aBlock [

	self isInCallback 
		ifTrue: [ super enterSystem: aBlock ]
		ifFalse: [ aBlock value ]
]

{ #category : 'deferring - gtk' }
GtkRunLoop >> forceDefer: aBlock [
	| sem result exception |

	callerProcess := Processor activeProcess.
	sem := Semaphore new.
	exception := nil.
	mutex critical: [ 
		GQueueIdle uniqueInstance idleAdd: [
			result := [
				aBlock 
					on: Exception 
					do: [ :e | exception := e freeze ] ] 
				ensure: [ 
					sem signal ] ] ].
	sem wait.
	callerProcess := nil.

	exception ifNotNil: [ 
		GtkDeferredError signalForException: exception ].

	^ result
]

{ #category : 'initialization' }
GtkRunLoop >> initialize [

	super initialize.
	mutex := Mutex new
]

{ #category : 'private - installing' }
GtkRunLoop >> installRunLoop [

	'Installing Gtk4 event loop' asBeaconSignal emit. 

	context := GMainContext default.
	context acquire
		ifFalse: [ self error: 'I cannot acquire the main context' ].	
	
	runProcess := [
		TFProcessLocalWorker worker: TFMainThreadRunner uniqueInstance. 
		[ running ] whileTrue: [ 
			context iteration: true ].
		context release.	
		'Gtk4 event loop ended' asBeaconSignal emit.
	] 
	forkAt: Processor lowIOPriority
	named: 'Gtk4 event loop'
]

{ #category : 'testing' }
GtkRunLoop >> isRunning [

	^ running 
		and: [ runProcess notNil 
		and: [ runProcess isTerminated not ] ]
]

{ #category : 'accessing' }
GtkRunLoop >> naturalRunner [

	^ TFMainThreadRunner uniqueInstance
]

{ #category : 'private - installing' }
GtkRunLoop >> uninstallRunLoop [

	self forceDefer: [ running := false ]
]
