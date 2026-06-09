"
The ::activate signal is emitted on the primary instance when an activation occurs.

https://docs.gtk.org/gio/signal.Application.activate.html
"
Class {
	#name : 'GActivateApplicationCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'GLib-IO-Callbacks',
	#package : 'GLib-IO',
	#tag : 'Callbacks'
}

{ #category : 'signalling' }
GActivateApplicationCallback class >> signalName [

	^ 'activate'
]

{ #category : 'enumerating' }
GActivateApplicationCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :app | aBlock value ]
]

{ #category : 'accessing' }
GActivateApplicationCallback >> signature [

	^ #(void (void *app))
]
