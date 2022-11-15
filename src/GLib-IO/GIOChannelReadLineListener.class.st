"
A listener to be created using `GIOChannel>>#newReadListener:action:`.

It can be started and stopped.

The listener will handle two-side processes: 
1. it will create an FFI worker thread (`TFWorker`) that will be prepared to be stopped in the read operation. 
2. it will also create a local process that will also be stopped waiting for read operations to be executed.
"
Class {
	#name : #GIOChannelReadLineListener,
	#superclass : #Object,
	#instVars : [
		'worker',
		'process',
		'channel',
		'name',
		'action'
	],
	#pools : [
		'GIOStatus'
	],
	#category : #'GLib-IO'
}

{ #category : #'instance creation' }
GIOChannelReadLineListener class >> newName: aName channel: aChannel action: aBlock [

	^ self new 
		initializeName: aName 
			channel: aChannel
			action: aBlock;
		yourself
]

{ #category : #accessing }
GIOChannelReadLineListener >> action [

	^ action
]

{ #category : #accessing }
GIOChannelReadLineListener >> channel [

	^ channel
]

{ #category : #initialization }
GIOChannelReadLineListener >> initializeName: aName channel: aChannel action: aBlock [

	self initialize.
	name := aName.
	channel := aChannel.
	action := aBlock
]

{ #category : #testing }
GIOChannelReadLineListener >> isRunning [
	
	^ process notNil 
		and: [ process isTerminated not ]
]

{ #category : #accessing }
GIOChannelReadLineListener >> name [

	^ name
]

{ #category : #'instance creation' }
GIOChannelReadLineListener >> newWorker [

	^ TFWorker named: ('channel_listener_{1}' format: { self name })
]

{ #category : #starting }
GIOChannelReadLineListener >> start [

	self isRunning ifTrue: [ ^ self ].

	process := [
		| status |
		TFProcessLocalWorker worker: self worker.
		[ status := self channel readLineTo: self action ]
		doWhileTrue: [ status ~= G_IO_STATUS_EOF ] ]
	forkNamed: ('Channel read listener: {1}' format: { self name })
]

{ #category : #starting }
GIOChannelReadLineListener >> stop [

	process ifNil: [ ^ self ].
	
	process terminate.
	process := nil.
	worker release.
	worker := nil
]

{ #category : #accessing }
GIOChannelReadLineListener >> worker [

	^ worker ifNil: [ worker := self newWorker ]
]
