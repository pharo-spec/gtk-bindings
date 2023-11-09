"
A generic callback for the GObject system.
It will execute inside a run loop, and this will be marked accordingly (calling callbackEnter).
It can also mark its conclusion status (suceed or failure)

"
Class {
	#name : 'GCallback',
	#superclass : 'FFICallback',
	#traits : 'GObjectTLibrary',
	#classTraits : 'GObjectTLibrary classTrait',
	#pools : [
		'GObjectTypes'
	],
	#category : 'GObject-Callbacks',
	#package : 'GObject',
	#tag : 'Callbacks'
}

{ #category : 'instance creation' }
GCallback class >> null [

	^ self new
]

{ #category : 'evaluating' }
GCallback >> basicValueWithArguments: args [
	"This method is using a side effect of ensure (returning from it) in PURPOSE because I need to be 
	 sure an answer is provided and the callback is returned when a debug session is aborted (the 
	 debugger is closed without handling the exception). 
	 So, when debug session terminates this process (See GtkDebugSession>>terminate), ensure blocks 
	 are executed and this one will answer and return a value, allowing Gtk3 to continue working."
	| result finished |

	finished := false.
	^ [ 
		result := block valueWithArguments: args.
		self beSuccess.
		finished := true.
		result ]
	ensure: [
		finished ifFalse: [  self beFailed ] ]
]

{ #category : 'evaluating' }
GCallback >> valueWithArguments: args [

	GRunLoop current callbackEnter.	
	^ self basicValueWithArguments: args
]
