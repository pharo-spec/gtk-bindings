Class {
	#name : #GIOChannelLibrary,
	#superclass : #GdkLibrary,
	#category : #'GLib-IO'
}

{ #category : #accessing }
GIOChannelLibrary >> runner [

	^ TFProcessLocalWorker new 
		defaultWorker: super runner;
		yourself
]
