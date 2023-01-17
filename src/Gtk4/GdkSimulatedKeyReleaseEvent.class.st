"
Simulate a `GdkKeyReleaseEvent`
"
Class {
	#name : #GdkSimulatedKeyReleaseEvent,
	#superclass : #GdkSimulatedKeyEvent,
	#category : #'Gtk4-Event-Simulated'
}

{ #category : #visiting }
GdkSimulatedKeyReleaseEvent >> accept: aVisitor [

	^ aVisitor visitKeyUpEvent: self
]

{ #category : #testing }
GdkSimulatedKeyReleaseEvent >> isKeyRelease [

	^ true
]
