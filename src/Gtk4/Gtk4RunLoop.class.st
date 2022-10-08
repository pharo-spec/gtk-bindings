Class {
	#name : #Gtk4RunLoop,
	#superclass : #GRunLoop,
	#instVars : [
		'callerProcess'
	],
	#category : #Gtk4
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
		ifTrue: [ ^ aBlock value ].

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

{ #category : #initialization }
Gtk4RunLoop >> initialize [

	super initialize.
	running := true
]

{ #category : #'private - installing' }
Gtk4RunLoop >> installRunLoop [

	"gtk4 does not needs this"
]

{ #category : #testing }
Gtk4RunLoop >> isRunning [

	^ true
]

{ #category : #'private - installing' }
Gtk4RunLoop >> uninstallRunLoop [

	"gtk4 does not needs this"
]
