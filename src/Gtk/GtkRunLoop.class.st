"
I'm a base run loop for gtk applications.
I define the base behaviour of a run loop: 

- start/stop 
- event processing

I also can handle deferred actions to be executed when the process allows it. This is specially useful to keep safeness of execution when the execution control is on gtk side (see GtkMainRunLoop)
"
Class {
	#name : #GtkRunLoop,
	#superclass : #GRunLoop,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : #'Gtk-Base'
}

{ #category : #accessing }
GtkRunLoop class >> activateDeferVerification [
	<script>

	TFCalloutAPI activateTraceWith: [ :sender |
		 self current isDeferring ifFalse: [ 
			(({ GRunLoop. GtkRunLoop } includes: sender methodClass) 
				or: [ (sender methodClass name beginsWith: 'Gtk') not ]) 
				ifFalse: [ Stdio stdout << sender printString; crlf  ] ] ]
]

{ #category : #accessing }
GtkRunLoop class >> activateDeferVerification2 [
	<script>

	TFCalloutAPI activateTraceWith: [ :sender |
		 "self current isDeferring ifFalse: [" 
			(({ GRunLoop. GtkRunLoop } includes: sender methodClass) 
				or: [ (sender methodClass name beginsWith: 'Gtk') not ]) 
				ifFalse: [ Stdio stdout << sender printString; crlf  ] ] "]"
]

{ #category : #accessing }
GtkRunLoop class >> bestStrategyClass [

	^ Smalltalk vm isRunningInWorkerThread 
		ifTrue: [ GtkMainRunLoop ]
		ifFalse: [ GtkPollingRunLoop ]
]

{ #category : #accessing }
GtkRunLoop class >> deactivateDeferVerification [
	<script>

	TFCalloutAPI resetTrace
]

{ #category : #private }
GtkRunLoop class >> defaultRunLoopClass [

	^ GtkPollingRunLoop
]

{ #category : #accessing }
GtkRunLoop class >> install [

	self = GtkRunLoop ifTrue: [ 
		self error: 'I''m an abstract class. You need to install one of my subclasses.' ].
	^ super install
]

{ #category : #accessing }
GtkRunLoop class >> uniqueInstance [
	
	self = GtkRunLoop 
		ifTrue: [ self error: 'I''m an abstract class. Use one of my children.' ].
	^ super uniqueInstance
]

{ #category : #deferring }
GtkRunLoop >> forceDefer: aBlock [

	GIdle uniqueInstance idleAddFull: aBlock
]
