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

{ #category : 'running' }
GtkRunLoop >> cleanUpFinalizationRegistry [
	
	GExternalResourceManager reset
]

{ #category : 'running' }
GtkRunLoop >> cleanUpOldProcesses [

	"clean up gtk4 run loop possible remainings (this may happen on certain 
	 exit conditions)"
	Processor allProcesses 
		select: [ :each | each name beginsWith: 'Gtk4' ]
		thenDo: [ :each | each terminate ]

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
	| sem result "exception" |

	callerProcess := Processor activeProcess.
	sem := Semaphore new.
	"exception := nil."
	mutex critical: [ 
		GQueueIdle uniqueInstance idleAdd: [
			result := [
				aBlock 
					on: Exception 
					fork: [ :e | e pass ] ] 
				ensure: [ 
					sem signal ] ] ].
	sem wait.
	callerProcess := nil.

	"exception ifNotNil: [
		logger trace: exception. 
		GtkDeferredError signalForException: exception ]."

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

{ #category : 'running' }
GtkRunLoop >> preInstallRunLoop [ 

	self cleanUpFinalizationRegistry.
	self cleanUpOldProcesses
]

{ #category : 'private - installing' }
GtkRunLoop >> uninstallRunLoop [

	self forceDefer: [ running := false ]
]
