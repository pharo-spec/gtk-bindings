"
Event loop for Gtk4
"
Class {
	#name : #GtkRunLoop,
	#superclass : #GRunLoop,
	#instVars : [
		'callerProcess',
		'context',
		'runProcess'
	],
	#category : #'Gtk-Application'
}

{ #category : #accessing }
GtkRunLoop >> callbackEnter [

	TFProcessLocalWorker worker: self naturalRunner.
	super callbackEnter
]

{ #category : #accessing }
GtkRunLoop >> callerProcess [

	^ callerProcess
]

{ #category : #accessing }
GtkRunLoop >> defer: aBlock [

	(self isRunning not 
		or: [ self isInCallback ]) 
		ifTrue: [ 
			^ aBlock value ].

	^ self forceDefer: aBlock	
]

{ #category : #accessing }
GtkRunLoop >> forceDefer: aBlock [
	| sem result exception |

	callerProcess := Processor activeProcess.
	sem := Semaphore new.
	exception := nil.
	GIdle uniqueInstance idleAddFull: [
		result := [ 
			aBlock 
				on: Exception 
				do: [ :e | exception := e freeze ] ] 
			ensure: [ sem signal ] ].
	sem wait.
	callerProcess := nil.

	exception ifNotNil: [ 
		GtkDeferredError signalForException: exception ].

	^ result
]

{ #category : #'private - installing' }
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

{ #category : #testing }
GtkRunLoop >> isRunning [

	^ running 
		and: [ runProcess notNil 
		and: [ runProcess isTerminated not ] ]
]

{ #category : #accessing }
GtkRunLoop >> naturalRunner [

	^ TFMainThreadRunner uniqueInstance
]

{ #category : #'private - installing' }
GtkRunLoop >> uninstallRunLoop [

	self forceDefer: [ running := false ]
]
