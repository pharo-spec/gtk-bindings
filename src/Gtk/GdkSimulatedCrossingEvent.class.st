"
Simulate a `GdkCrossingEvent`
"
Class {
	#name : 'GdkSimulatedCrossingEvent',
	#superclass : 'GdkSimulatedEvent',
	#category : 'Gtk-Events-Simulated',
	#package : 'Gtk',
	#tag : 'Events-Simulated'
}

{ #category : 'visiting' }
GdkSimulatedCrossingEvent >> accept: aVisitor [

	^ aVisitor visitCrossingEvent: self
]

{ #category : 'testing' }
GdkSimulatedCrossingEvent >> isCrossingEvent [

	^ true
]

{ #category : 'testing' }
GdkSimulatedCrossingEvent >> isEnter [

	^ false
]

{ #category : 'testing' }
GdkSimulatedCrossingEvent >> isLeave [

	^ false
]
