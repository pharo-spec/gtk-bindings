"
I'm a signal to register when a finalise data is happening.
"
Class {
	#name : 'GFinalizeAnnouncement',
	#superclass : 'GSignalBaseAnnouncement',
	#instVars : [
		'target',
		'handle'
	],
	#category : 'GObject-Signal',
	#package : 'GObject',
	#tag : 'Signal'
}

{ #category : 'instance creation' }
GFinalizeAnnouncement class >> emitTarget: aTarget handle: aHandle [
	^ (self newTarget: aTarget handle: aHandle) emit
]

{ #category : 'instance creation' }
GFinalizeAnnouncement class >> newTarget: aTarget [
	^ self newTarget: aTarget handle: nil
]

{ #category : 'instance creation' }
GFinalizeAnnouncement class >> newTarget: aTarget handle: aHandle [
	^ self new 
		target: aTarget;
		handle: aHandle
]

{ #category : 'accessing' }
GFinalizeAnnouncement >> handle [
	^ handle
]

{ #category : 'accessing' }
GFinalizeAnnouncement >> handle: anObject [
	handle := anObject
]

{ #category : 'printing' }
GFinalizeAnnouncement >> printOneLineContentsOn: stream [
	
	stream
		<< self target name  
		<< ' ' << self handle printString
]

{ #category : 'accessing' }
GFinalizeAnnouncement >> target [
	^ target
]

{ #category : 'accessing' }
GFinalizeAnnouncement >> target: anObject [
	target := anObject
]
