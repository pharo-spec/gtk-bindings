"
A listener to be created using `GIOChannel>>#newReadListener:action:`.

It can be started and stopped.

The listener will handle two-side processes: 
1. it will create an FFI worker thread (`TFWorker`) that will be prepared to be stopped in the read operation. 
2. it will also create a local process that will also be stopped waiting for read operations to be executed.
"
Class {
	#name : 'GIOChannelReadLineListener',
	#superclass : 'Object',
	#instVars : [
		'worker',
		'process',
		'channel',
		'name',
		'action',
		'announcer'
	],
	#pools : [
		'GIOStatus'
	],
	#category : 'GLib-IO-Process',
	#package : 'GLib-IO',
	#tag : 'Process'
}

{ #category : 'instance creation' }
GIOChannelReadLineListener class >> newName: aName channel: aChannel action: aBlock [

	^ self new 
		initializeName: aName 
			channel: aChannel
			action: aBlock;
		yourself
]

{ #category : 'accessing' }
GIOChannelReadLineListener >> action [

	^ action
]

{ #category : 'private' }
GIOChannelReadLineListener >> announce: anAnnouncement [

	announcer ifNil: [ ^ self ].
	announcer announce: anAnnouncement
]

{ #category : 'private' }
GIOChannelReadLineListener >> announceTerminatedWithStatus: status [

	self announce: (GIOChannelTerminatedAnnouncement newStatus: status)
]

{ #category : 'accessing' }
GIOChannelReadLineListener >> announcer [

	announcer ifNil: [ announcer := Announcer new ].
	"Do not register strong references"
	^ announcer weak
]

{ #category : 'accessing' }
GIOChannelReadLineListener >> channel [

	^ channel
]

{ #category : 'initialization' }
GIOChannelReadLineListener >> initialize [
	
	self class initializeSlots: self.
	super initialize
]

{ #category : 'initialization' }
GIOChannelReadLineListener >> initializeName: aName channel: aChannel action: aBlock [

	self initialize.
	name := aName.
	channel := aChannel shallowCopy.
	action := aBlock
]

{ #category : 'testing' }
GIOChannelReadLineListener >> isRunning [
	
	^ channel notNil 
		and: [ channel isNull not 
		and: [ process notNil 
		and: [ process isTerminated not ] ] ]
]

{ #category : 'accessing' }
GIOChannelReadLineListener >> name [

	^ name
]

{ #category : 'instance creation' }
GIOChannelReadLineListener >> newWorker [

	^ TFWorker named: ('channel_listener_{1}' format: { self name })
]

{ #category : 'private' }
GIOChannelReadLineListener >> readLineToAction [
	
	^ self channel readLineTo: self action
]

{ #category : 'starting' }
GIOChannelReadLineListener >> start [

	self isRunning ifTrue: [ ^ self ].

	process := [
		| status |
		TFProcessLocalWorker worker: self worker.
		[ status := self readLineToAction ]
		doWhileTrue: [ status ~= G_IO_STATUS_EOF ].
		self announceTerminatedWithStatus: status ]
	forkNamed: ('Channel read listener: {1}' format: { self name })
]

{ #category : 'starting' }
GIOChannelReadLineListener >> stop [

	process ifNil: [ ^ self ].
	
	process terminate.
	process := nil.
	worker release.
	worker := nil
]

{ #category : 'events' }
GIOChannelReadLineListener >> whenTerminatedDo: aBlock [

	self announcer
		when: GIOChannelTerminatedAnnouncement
		do: aBlock
		for: aBlock receiver
]

{ #category : 'accessing' }
GIOChannelReadLineListener >> worker [

	^ worker ifNil: [ worker := self newWorker ]
]
