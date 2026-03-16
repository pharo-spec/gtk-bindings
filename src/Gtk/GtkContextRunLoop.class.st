"
A runloop to be executed outside the main runloop cycle.
This process is used, for example, to run dialogs (See *in spec* `GtkDialogWindowAdapter`).

This class is used just in some few cases that require the modal to be executed from the event loop (the main thread).  
An example of it is the usage of a confirmation dialog when closing a dirty window (you do not want to go back to 
from validation event -windowWillClose- before confirming)... for those cases you need to use  `GtkContextRunLoop`.  
But the backend should choose that for itself.
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

{ #category : 'instance creation' }
GtkContextRunLoop class >> forContext: inCallback [

	^ (inCallback
			ifTrue: [ self ]
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
	GRunLoop defer: [
		context := GMainContext null.
		done := false.
		[ done ] whileFalse: [ 
			context iteration: true ] ]
]

{ #category : 'private' }
GtkContextRunLoop >> stop [

	done := true.
	context wakeup
]
