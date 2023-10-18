"
An error thrown while performing a deferred action.
"
Class {
	#name : 'GtkDeferredError',
	#superclass : 'Error',
	#instVars : [
		'exception'
	],
	#category : 'Gtk-Application',
	#package : 'Gtk',
	#tag : 'Application'
}

{ #category : 'signalling' }
GtkDeferredError class >> signalForException: anError [

	^ self new
		exception: anError;
		signal
]

{ #category : 'handling' }
GtkDeferredError >> defaultAction [

	^ self exception defaultAction
]

{ #category : 'accessing' }
GtkDeferredError >> exception [

	^ exception
]

{ #category : 'accessing' }
GtkDeferredError >> exception: anObject [

	exception := anObject
]

{ #category : 'accessing' }
GtkDeferredError >> originException [

	^ self exception originException
]
