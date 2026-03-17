"
A runloop to be executed outside the main runloop cycle.
Subclasses implement specific behaviors.
"
Class {
	#name : 'GtkContextRunLoop',
	#superclass : 'Object',
	#instVars : [
		'done'
	],
	#category : 'Gtk-Application',
	#package : 'Gtk',
	#tag : 'Application'
}

{ #category : 'instance creation' }
GtkContextRunLoop class >> forContext: inCallback [

	^ (inCallback
			ifTrue: [ GtkMainContextRunLoop ]
			ifFalse: [ GtkSemaphoreContextRunLoop ])
		new
]

{ #category : 'running' }
GtkContextRunLoop >> done [

	self isRunning ifFalse: [ ^ self ].
	self stop
]

{ #category : 'initialization' }
GtkContextRunLoop >> initialize [

	super initialize.
	done := true
]

{ #category : 'testing' }
GtkContextRunLoop >> isRunning [

	^ done not
]

{ #category : 'running' }
GtkContextRunLoop >> run [

	self isRunning ifTrue: [ ^ self ].
	self start
]

{ #category : 'private' }
GtkContextRunLoop >> start [

	self subclassResponsibility
]

{ #category : 'private' }
GtkContextRunLoop >> stop [

	self subclassResponsibility
]
