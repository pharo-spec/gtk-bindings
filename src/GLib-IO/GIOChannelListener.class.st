"
A listener to be created using `GIOChannel>>#newListener:action:`.

It can be started and stopped.

The listener will handle two-side processes: 
1. it will create an FFI worker thread (`TFWorker`) that will be prepared to ne stopped in the read/write operations. 
2. it will also create a local process that will also be stopped waiting for read/write operations to be executed.
"
Class {
	#name : #GIOChannelListener,
	#superclass : #Object,
	#instVars : [
		'worker',
		'process',
		'channel',
		'name',
		'action'
	],
	#category : #'GLib-IO'
}

{ #category : #'instance creation' }
GIOChannelListener class >> newName: aName channel: aChannel action: aBlock [

	^ self new 
		initializeName: aName 
			channel: aChannel
			action: aBlock;
		yourself
]

{ #category : #accessing }
GIOChannelListener >> action [

	^ action
]

{ #category : #accessing }
GIOChannelListener >> channel [

	^ channel
]

{ #category : #initialization }
GIOChannelListener >> initializeName: aName channel: aChannel action: aBlock [

	self initialize.
	name := aName.
	channel := aChannel.
	action := aBlock
]

{ #category : #testing }
GIOChannelListener >> isRunning [
	
	^ process notNil 
		and: [ process isTerminated not ]
]

{ #category : #accessing }
GIOChannelListener >> name [

	^ name
]

{ #category : #'instance creation' }
GIOChannelListener >> newWorker [

	^ TFWorker named: ('channel_listener_{1}' format: { self name })
]

{ #category : #starting }
GIOChannelListener >> start [

	process := [ 
		TFProcessLocalWorker worker: self worker.
		[ true ] whileTrue: [ 
			self action value: self channel ]
	]
	forkNamed: ('Channel listener: {1}' format: { self name })

]

{ #category : #starting }
GIOChannelListener >> stop [

	process ifNil: [ ^ self ].
	
	process terminate.
	process := nil.
	worker release.
	worker := nil
]

{ #category : #accessing }
GIOChannelListener >> worker [

	^ worker ifNil: [ worker := self newWorker ]
]
