Class {
	#name : #GdkSimulatedScrollEvent,
	#superclass : #GdkSimulatedEvent,
	#instVars : [
		'dx',
		'dy'
	],
	#category : #'Gtk-Events-Simulated'
}

{ #category : #visiting }
GdkSimulatedScrollEvent >> accept: aVisitor [

	aVisitor visitScrollEvent: self
]

{ #category : #accessing }
GdkSimulatedScrollEvent >> deltas [

	^ dx @ dy
]

{ #category : #accessing }
GdkSimulatedScrollEvent >> dx [

	^ dx
]

{ #category : #accessing }
GdkSimulatedScrollEvent >> dx: anObject [

	dx := anObject
]

{ #category : #accessing }
GdkSimulatedScrollEvent >> dy [

	^ dy
]

{ #category : #accessing }
GdkSimulatedScrollEvent >> dy: anObject [

	dy := anObject
]
