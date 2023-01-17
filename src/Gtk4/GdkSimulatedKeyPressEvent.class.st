"
Simulate a `GdkKeyPressEvent`
"
Class {
	#name : #GdkSimulatedKeyPressEvent,
	#superclass : #GdkSimulatedKeyEvent,
	#category : #'Gtk4-Event-Simulated'
}

{ #category : #visiting }
GdkSimulatedKeyPressEvent >> accept: aVisitor [

	^ aVisitor visitKeyDownEvent: self
]

{ #category : #testing }
GdkSimulatedKeyPressEvent >> isKeyPress [

	^ true
]
