"
An event caused by a pointing device moving between surfaces.

https://docs.gtk.org/gdk4/class.CrossingEvent.html
"
Class {
	#name : 'GdkCrossingEvent',
	#superclass : 'GdkEvent',
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'visiting' }
GdkCrossingEvent >> accept: aVisitor [
	
	^ aVisitor visitCrossingEvent: self
]

{ #category : 'accessing' }
GdkCrossingEvent >> detail [

	^ self ffiCall: #(GdkNotifyType gdk_crossing_event_get_detail (self))
]

{ #category : 'testing' }
GdkCrossingEvent >> isCrossingEvent [

	^ true
]

{ #category : 'testing' }
GdkCrossingEvent >> isEnter [

	^ false
]

{ #category : 'testing' }
GdkCrossingEvent >> isFocus [

	^ self ffiCall: #(gboolean gdk_crossing_event_get_focus (self))
]

{ #category : 'testing' }
GdkCrossingEvent >> isLeave [

	^ false
]

{ #category : 'accessing' }
GdkCrossingEvent >> mode [

	^ self ffiCall: #(GdkCrossingMode gdk_crossing_event_get_mode (self))
]
