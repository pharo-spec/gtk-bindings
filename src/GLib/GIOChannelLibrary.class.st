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
