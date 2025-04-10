"
A runloop to be executed outside the main runloop cycle.
This process is used, for example, to run dialogs (See *in spec* `GtkDialogWindowAdapter`).
"
Class {
	#name : 'GtkContextRunLoop',
	#superclass : 'Object',
	#instVars : [
		'done',
		'context'
	],
	#category : 'Gtk-Application',
	#package : 'Gtk',
	#tag : 'Application'
}

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

	context := GMainContext null.
	done := false.
	[ done ] whileFalse: [ 
		context iteration: true ]
]

{ #category : 'private' }
GtkContextRunLoop >> stop [

	done := true.
	context wakeup
]
