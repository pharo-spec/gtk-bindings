Class {
	#name : #Gtk4RunLoop,
	#superclass : #GRunLoop,
	#instVars : [
		'callerProcess',
		'context',
		'application'
	],
	#category : #'Gtk4-Application'
}

{ #category : #accessing }
Gtk4RunLoop >> callbackEnter [

	TFProcessLocalWorker worker: TFMainThreadRunner uniqueInstance.
	super callbackEnter
]

{ #category : #accessing }
Gtk4RunLoop >> callerProcess [

	^ callerProcess
]

{ #category : #accessing }
Gtk4RunLoop >> defer: aBlock [
	| sem result |

	(self isRunning not 
		or: [ self isInCallback ]) 
		ifTrue: [ 
			^ aBlock value ].

	callerProcess := Processor activeProcess.
	sem := Semaphore new.
	GIdle uniqueInstance idleAddFull: [
		result := aBlock ensure: [ sem signal ] ].
	sem wait.
	callerProcess := nil.

	^ result
]

{ #category : #deferring }
Gtk4RunLoop >> forceDefer: aBlock [

	GIdle uniqueInstance idleAddFull: aBlock
]

{ #category : #'private - installing' }
Gtk4RunLoop >> installRunLoop [

	application := GtkApplication 
		newId: 'org.pharo.Gtk4Application'
		flags: GApplicationFlags G_APPLICATION_NON_UNIQUE.
	application register.
	
	self launchEventLoop
]

{ #category : #testing }
Gtk4RunLoop >> isRunning [

	^ running
]

{ #category : #'private - installing' }
Gtk4RunLoop >> launchEventLoop [	

	context := GMainContext default.
	context acquire
		ifFalse: [ self error: 'I cannot acquire the main context' ].	
	
	[ 
		TFProcessLocalWorker worker: TFMainThreadRunner uniqueInstance. 
		[ running ] 
		whileTrue: [ context iteration: true ].
		context release.	
		running := false
	] 
	forkAt: Processor lowIOPriority
	named: 'Gtk4 Event loop'
]

{ #category : #accessing }
Gtk4RunLoop >> naturalRunner [

	^ TFMainThreadRunner uniqueInstance
]

{ #category : #'private - installing' }
Gtk4RunLoop >> uninstallRunLoop [

	self forceDefer: [ running := false ]
]
