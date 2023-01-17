"
Simulate a `GdkMotionEvent`
"
Class {
	#name : #GdkSimulatedMotionEvent,
	#superclass : #GdkSimulatedEvent,
	#instVars : [
		'position'
	],
	#category : #'Gtk4-Event-Simulated'
}

{ #category : #'instance creation' }
GdkSimulatedMotionEvent class >> newPosition: aPoint [

	^ self new
		position: aPoint;
		yourself
]

{ #category : #visiting }
GdkSimulatedMotionEvent >> accept: aVisitor [

	^ aVisitor visitMouseMoveEvent: self
]

{ #category : #testing }
GdkSimulatedMotionEvent >> isMotionEvent [

	^ true
]

{ #category : #accessing }
GdkSimulatedMotionEvent >> position [

	^ position
]

{ #category : #accessing }
GdkSimulatedMotionEvent >> position: aPoint [

	position := aPoint
]
