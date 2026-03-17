"
A context run loop that just uses a semaphore wait/signal cycle to be uses to execute modal dialogs.

This is **the most common** use case that will fit most of the cases the framework require (the ones that are 
displayed from within pharo, and hence are effectively outside the even loop).  
There are, however, some fewe cases that require the modal to be executed from the event loop (the main thread).  
An example of it is the usage of a confirmation dialog when closing a dirty window (you do not want to go back to 
from validation event -windowWillClose- before confirming)... for those cases you need to use  `GtkContextRunLoop`.  
But the backend should choose that for itself.
"
Class {
	#name : 'GtkMainContextRunLoop',
	#superclass : 'GtkContextRunLoop',
	#instVars : [
		'context'
	],
	#category : 'Gtk-Application',
	#package : 'Gtk',
	#tag : 'Application'
}

{ #category : 'private' }
GtkMainContextRunLoop >> start [

	GRunLoop defer: [
		context := GMainContext null.
		done := false.
		[ done ] whileFalse: [ 
			context iteration: true ] ]
]

{ #category : 'private' }
GtkMainContextRunLoop >> stop [

	done := true.
	context wakeup
]
