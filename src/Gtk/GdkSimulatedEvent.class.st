"
Simulated events are events that behave internally as a `GdkEvent`, but is not existing in gtk side.
They are useful to not break the way we handle events, since in Gtk4 sometimes I do not have an event but its inner values, but I may want to use, for example, a visitor on ""events"", etc.

"
Class {
	#name : 'GdkSimulatedEvent',
	#superclass : 'Object',
	#instVars : [
		'wasHandled',
		'controller',
		'modifierState'
	],
	#category : 'Gtk-Events-Simulated',
	#package : 'Gtk',
	#tag : 'Events-Simulated'
}

{ #category : 'visiting' }
GdkSimulatedEvent >> accept: aVisitor [

	self subclassResponsibility
]

{ #category : 'accessing' }
GdkSimulatedEvent >> button [
	"button number pressed. 
	 by default, zero"

	^ 0
]

{ #category : 'accessing' }
GdkSimulatedEvent >> controller [

	^ controller
]

{ #category : 'accessing' }
GdkSimulatedEvent >> controller: aMotionController [

	controller := aMotionController
]

{ #category : 'initialization' }
GdkSimulatedEvent >> initialize [

	super initialize.
	wasHandled := false
]

{ #category : 'testing' }
GdkSimulatedEvent >> isButtonEvent [

	^ false
]

{ #category : 'testing' }
GdkSimulatedEvent >> isCrossingEvent [

	^ false
]

{ #category : 'testing' }
GdkSimulatedEvent >> isKeyEvent [

	^ false
]

{ #category : 'testing' }
GdkSimulatedEvent >> isMotionEvent [

	^ false
]

{ #category : 'accessing' }
GdkSimulatedEvent >> modifierState [

	^ modifierState ifNil: [ modifierState := self controller currentEventState ]
]

{ #category : 'compatibility' }
GdkSimulatedEvent >> wasHandled [

	^ wasHandled
]

{ #category : 'compatibility' }
GdkSimulatedEvent >> wasHandled: aBoolean [

	wasHandled := aBoolean
]

{ #category : 'accessing' }
GdkSimulatedEvent >> withPositionRelativeTo: aGtkMorphicWorldView [
]
