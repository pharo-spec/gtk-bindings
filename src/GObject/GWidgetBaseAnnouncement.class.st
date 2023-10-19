"
I'm a generic widget signal.
"
Class {
	#name : 'GWidgetBaseAnnouncement',
	#superclass : 'GSignalBaseAnnouncement',
	#instVars : [
		'widget'
	],
	#category : 'GObject-Signal',
	#package : 'GObject',
	#tag : 'Signal'
}

{ #category : 'instance creation' }
GWidgetBaseAnnouncement class >> emitWidget: aWidget [

	^ (self newWidget: aWidget) emit
]

{ #category : 'instance creation' }
GWidgetBaseAnnouncement class >> newWidget: aWidget [
	^ self new widget: aWidget
]

{ #category : 'printing' }
GWidgetBaseAnnouncement >> printOneLineContentsOn: stream [
	
	stream
		<< self widget className  
		<< ' ' << self widget getHandle printString
]

{ #category : 'accessing' }
GWidgetBaseAnnouncement >> widget [
	^ widget
]

{ #category : 'accessing' }
GWidgetBaseAnnouncement >> widget: anObject [
	widget := anObject
]
