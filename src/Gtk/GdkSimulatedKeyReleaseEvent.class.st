"
Simulate a `GdkKeyReleaseEvent`
"
Class {
	#name : 'GdkSimulatedKeyReleaseEvent',
	#superclass : 'GdkSimulatedKeyEvent',
	#category : 'Gtk-Events-Simulated',
	#package : 'Gtk',
	#tag : 'Events-Simulated'
}

{ #category : 'visiting' }
GdkSimulatedKeyReleaseEvent >> accept: aVisitor [

	^ aVisitor visitKeyUpEvent: self
]

{ #category : 'testing' }
GdkSimulatedKeyReleaseEvent >> isKeyRelease [

	^ true
]
