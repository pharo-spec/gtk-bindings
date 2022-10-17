Class {
	#name : #Gtk4RunLoop,
	#superclass : #GRunLoop,
	#instVars : [
		'callerProcess',
		'context',
		'runProcess'
	],
	#category : #'Gtk4-Application'
}

{ #category : #accessing }
Gtk4RunLoop >> callbackEnter [

	TFProcessLocalWorker worker: self naturalRunner.
	super callbackEnter
]

{ #category : #accessing }
Gtk4RunLoop >> callerProcess [

	^ callerProcess
]

{ #category : #accessing }
Gtk4RunLoop >> defer: aBlock [

	(self isRunning not 
		or: [ self isInCallback ]) 
		ifTrue: [ 
			^ aBlock value ].

	^ self forceDefer: aBlock	
]

{ #category : #accessing }
Gtk4RunLoop >> forceDefer: aBlock [
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
		exception defaultAction ].

	^ result
]

{ #category : #'private - installing' }
Gtk4RunLoop >> installRunLoop [

	context := GMainContext default.
	context acquire
		ifFalse: [ self error: 'I cannot acquire the main context' ].	
	
	runProcess := [ 
		TFProcessLocalWorker worker: TFMainThreadRunner uniqueInstance. 
		[ running ] whileTrue: [ 
			context iteration: true ].
		context release.	
		running := false.
		'RUNLOOP ENDED' printToStdout
	] 
	forkAt: Processor lowIOPriority
	named: 'Gtk4 Event loop'
]

{ #category : #testing }
Gtk4RunLoop >> isRunning [

	^ running 
		and: [ runProcess notNil 
		and: [ runProcess isTerminated not ] ]
]

{ #category : #accessing }
Gtk4RunLoop >> naturalRunner [

	^ TFMainThreadRunner uniqueInstance
]

{ #category : #'private - installing' }
Gtk4RunLoop >> uninstallRunLoop [

	self forceDefer: [ running := false ]
]
