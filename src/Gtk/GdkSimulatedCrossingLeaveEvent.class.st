"
Simulate a `GdkCrossingLeaveEvent`
"
Class {
	#name : #GdkSimulatedCrossingLeaveEvent,
	#superclass : #GdkSimulatedCrossingEvent,
	#category : #'Gtk-Events-Simulated'
}

{ #category : #testing }
GdkSimulatedCrossingLeaveEvent >> isLeave [

	^ true
]