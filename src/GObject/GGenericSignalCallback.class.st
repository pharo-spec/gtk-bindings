"
I'm a generic gtk signal to connect to. 
In general, you should not use this but one of the other callbacks inheriting from GSignalCallback
"
Class {
	#name : 'GGenericSignalCallback',
	#superclass : 'GSignalCallback',
	#instVars : [
		'signalName'
	],
	#category : 'GObject-Callbacks',
	#package : 'GObject',
	#tag : 'Callbacks'
}

{ #category : 'instance creation' }
GGenericSignalCallback class >> signal: aString signature: aSignature block: aBlock [

	^ (self 
		signature: aSignature 
		block: aBlock)
		signalName: aString;
		yourself
]

{ #category : 'accessing' }
GGenericSignalCallback >> signalName [

	^ signalName
]

{ #category : 'accessing' }
GGenericSignalCallback >> signalName: aString [

	signalName := aString
]
