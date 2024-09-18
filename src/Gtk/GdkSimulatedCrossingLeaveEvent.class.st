"
Simulate a `GdkCrossingLeaveEvent`
"
Class {
	#name : 'GdkSimulatedCrossingLeaveEvent',
	#superclass : 'GdkSimulatedCrossingEvent',
	#category : 'Gtk-Events-Simulated',
	#package : 'Gtk',
	#tag : 'Events-Simulated'
}

{ #category : 'testing' }
GdkSimulatedCrossingLeaveEvent >> isLeave [

	^ true
]
