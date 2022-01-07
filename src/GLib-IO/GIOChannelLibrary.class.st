"
Library to access gio functions. 
The only difference with a regular GLib is that it allows the usage of `TFProcessLocalWorker`
"
Class {
	#name : #GIOChannelLibrary,
	#superclass : #GLibLibrary,
	#category : #'GLib-IO'
}

{ #category : #accessing }
GIOChannelLibrary >> runner [

	^ TFProcessLocalWorker new 
		defaultWorker: super runner;
		yourself
]
