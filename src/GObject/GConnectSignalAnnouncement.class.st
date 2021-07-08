"
I signal a widget has connect to a gtk signal.
"
Class {
	#name : #GConnectSignalAnnouncement,
	#superclass : #GWidgetBaseAnnouncement,
	#instVars : [
		'signal'
	],
	#category : #'GObject-Signal'
}

{ #category : #'instance creation' }
GConnectSignalAnnouncement class >> emitWidget: aWidget signal: aName [

	^ (self 
		newWidget: aWidget 
		signal: aName)
		emit
]

{ #category : #'instance creation' }
GConnectSignalAnnouncement class >> newWidget: aWidget signal: aName [

	^ (self newWidget: aWidget)
		signal: aName;
		yourself
]

{ #category : #printing }
GConnectSignalAnnouncement >> printOneLineContentsOn: stream [
	
	super printOneLineContentsOn: stream.
	stream << ' ' << self signal
]

{ #category : #accessing }
GConnectSignalAnnouncement >> signal [
	^ signal
]

{ #category : #accessing }
GConnectSignalAnnouncement >> signal: anObject [
	signal := anObject
]
