"
An error thrown while performing a deferred action.
"
Class {
	#name : #GtkDeferredError,
	#superclass : #Error,
	#instVars : [
		'exception'
	],
	#category : #'Gtk4-Application'
}

{ #category : #signalling }
GtkDeferredError class >> signalForException: anError [

	^ self new
		exception: anError;
		signal
]

{ #category : #accessing }
GtkDeferredError >> defaultAction [

	^ self exception debug
]

{ #category : #accessing }
GtkDeferredError >> exception [

	^ exception
]

{ #category : #accessing }
GtkDeferredError >> exception: anObject [

	exception := anObject
]
