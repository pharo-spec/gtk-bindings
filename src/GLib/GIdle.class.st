"
I am a special class made to insert callbacks into the idle action. 
I exist because while running on main thread, gtk will execute gtk_main who will take over the thread. To insert commands, we need to add a call to one of the idle functions (see my implemented methods and senders to it for details)
"
Class {
	#name : 'GIdle',
	#superclass : 'GLibLibrary',
	#instVars : [
		'deferring',
		'mutex'
	],
	#category : 'GLib-Library',
	#package : 'GLib',
	#tag : 'Library'
}

{ #category : 'as yet unclassified' }
GIdle >> addFunction: function [

	deferring add: function
]

{ #category : 'private' }
GIdle >> gIdleAddFull: aCallback [

	self ffiCall: #(void g_idle_add_full(
		gint 100 "G_PRIORITY_HIGH_IDLE", 
		GCallback aCallback, 
		NULL, 
		NULL))
]

{ #category : 'accessing' }
GIdle >> idleAdd: aBlock [

	self halt.
	mutex critical: [ 
		| function |
		function := self newFunctionWith: aBlock. 
		self addFunction: function.
		self gIdleAddFull: function ]
]

{ #category : 'initialization' }
GIdle >> initialize [ 

	super initialize.
	mutex := Mutex new.
	deferring := IdentitySet new
]

{ #category : 'as yet unclassified' }
GIdle >> newFunctionWith: aBlock [
	| function |
	
	function := GSourceFunc new.
	function
	 	signature: #(guint (void *data))
		block: [ :data | 
			aBlock ensure: [ 
				self removeFunction: function ]. 	
			0 ].
		
	^ function
]

{ #category : 'as yet unclassified' }
GIdle >> removeFunction: function [
	
	mutex critical: [ 
		deferring 
			remove: function
			ifAbsent: [ ('{1} not found while removing. Skipping.' format: { function }) crTrace ] ].
]

{ #category : 'accessing' }
GIdle >> reset [

	deferring removeAll
]

{ #category : 'accessing platform' }
GIdle >> runner [

	^ TFSameThreadRunner uniqueInstance
]
