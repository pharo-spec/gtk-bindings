"
Simulate a `GdkCrossingLeaveEvent`
"
Class {
	#name : #GdkSimulatedCrossingLeaveEvent,
	#superclass : #GdkSimulatedCrossingEvent,
	#category : #'Gtk4-Event-Simulated'
}

{ #category : #testing }
GdkSimulatedCrossingLeaveEvent >> isLeave [

	^ true
]
