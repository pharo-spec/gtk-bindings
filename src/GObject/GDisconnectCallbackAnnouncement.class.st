"
I signal a callback has been disconnected from its owner widget
"
Class {
	#name : 'GDisconnectCallbackAnnouncement',
	#superclass : 'GSignalBaseAnnouncement',
	#instVars : [
		'callback',
		'number'
	],
	#category : 'GObject-Signal',
	#package : 'GObject',
	#tag : 'Signal'
}

{ #category : 'instance creation' }
GDisconnectCallbackAnnouncement class >> emitCallback: aCallback number: aNumber [ 

	^ (self 
		newCallback: aCallback 
		number: aNumber)
		emit
]

{ #category : 'instance creation' }
GDisconnectCallbackAnnouncement class >> newCallback: aCallback number: aNumber [ 

	^ self new 
		callback: aCallback;
		number: aNumber;
		yourself
]

{ #category : 'accessing' }
GDisconnectCallbackAnnouncement >> callback [
	^ callback
]

{ #category : 'accessing' }
GDisconnectCallbackAnnouncement >> callback: anObject [
	callback := anObject
]

{ #category : 'accessing' }
GDisconnectCallbackAnnouncement >> number [
	^ number
]

{ #category : 'accessing' }
GDisconnectCallbackAnnouncement >> number: anObject [
	number := anObject
]

{ #category : 'printing' }
GDisconnectCallbackAnnouncement >> printOneLineContentsOn: stream [
	
	stream
		<< self callback signalName
		<< ' (' << self number asString << ')'
]
