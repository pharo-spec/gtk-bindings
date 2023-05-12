"
Simulated events are events that behave internally as a `GdkEvent`, but is not existing in gtk side.
They are useful to not break the way we handle events, since in Gtk4 sometimes I do not have an event but its inner values, but I may want to use, for example, a visitor on ""events"", etc.

"
Class {
	#name : #GdkSimulatedEvent,
	#superclass : #Object,
	#instVars : [
		'wasHandled'
	],
	#category : #'Gtk-Events-Simulated'
}

{ #category : #visiting }
GdkSimulatedEvent >> accept: aVisitor [

	self subclassResponsibility
]

{ #category : #initialization }
GdkSimulatedEvent >> initialize [

	super initialize.
	wasHandled := false
]

{ #category : #testing }
GdkSimulatedEvent >> isCrossingEvent [

	^ false
]

{ #category : #testing }
GdkSimulatedEvent >> isKeyEvent [

	^ false
]

{ #category : #testing }
GdkSimulatedEvent >> isMotionEvent [

	^ false
]

{ #category : #compatibility }
GdkSimulatedEvent >> wasHandled [

	^ wasHandled
]

{ #category : #compatibility }
GdkSimulatedEvent >> wasHandled: aBoolean [

	wasHandled := aBoolean
]
