"
I signal a widget has received a gtk signal for which it was suscribed.
"
Class {
	#name : 'GWidgetSignaledAnnouncement',
	#superclass : 'GSignalBaseAnnouncement',
	#instVars : [
		'signal'
	],
	#category : 'GObject-Signal',
	#package : 'GObject',
	#tag : 'Signal'
}

{ #category : 'instance creation' }
GWidgetSignaledAnnouncement class >> emitSignal: aString [

	^ (self newSignal: aString) emit
]

{ #category : 'instance creation' }
GWidgetSignaledAnnouncement class >> newSignal: aString [

	^ self new signal: aString
]

{ #category : 'printing' }
GWidgetSignaledAnnouncement >> printOneLineContentsOn: stream [
	
	stream << self signal signalName
]

{ #category : 'accessing' }
GWidgetSignaledAnnouncement >> signal [
	^ signal
]

{ #category : 'accessing' }
GWidgetSignaledAnnouncement >> signal: anObject [
	signal := anObject
]
