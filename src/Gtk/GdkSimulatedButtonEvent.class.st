Class {
	#name : 'GdkSimulatedButtonEvent',
	#superclass : 'GdkSimulatedEvent',
	#traits : 'GdkTEventState',
	#classTraits : 'GdkTEventState classTrait',
	#instVars : [
		'position',
		'numberPress',
		'button'
	],
	#category : 'Gtk-Events-Simulated',
	#package : 'Gtk',
	#tag : 'Events-Simulated'
}

{ #category : 'instance creation' }
GdkSimulatedButtonEvent class >> newController: aGestureController position: aPoint numberPress: aNumber [

	^ self new 
		controller: aGestureController;
		position: aPoint;
		numberPress: aNumber;
		yourself
]

{ #category : 'visiting' }
GdkSimulatedButtonEvent >> accept: aVisitor [

	^ aVisitor visitMouseButtonPressEvent: self
]

{ #category : 'accessing' }
GdkSimulatedButtonEvent >> beMiddleButton [

	button := 2
]

{ #category : 'accessing' }
GdkSimulatedButtonEvent >> bePrimaryButton [

	button := 1
]

{ #category : 'accessing' }
GdkSimulatedButtonEvent >> beSecondaryButton [

	button := 3
]

{ #category : 'accessing' }
GdkSimulatedButtonEvent >> button [

	^ button
]

{ #category : 'accessing' }
GdkSimulatedButtonEvent >> controller: aController [

	super controller: aController. 
	button := aController button
]

{ #category : 'testing' }
GdkSimulatedButtonEvent >> isButtonEvent [

	^ true
]

{ #category : 'testing' }
GdkSimulatedButtonEvent >> isMiddleButton [

	^ button = 2
]

{ #category : 'testing' }
GdkSimulatedButtonEvent >> isPrimaryButton [

	^ button = 1
]

{ #category : 'testing' }
GdkSimulatedButtonEvent >> isSecondaryButton [

	^ button = 2
]

{ #category : 'testing' }
GdkSimulatedButtonEvent >> isWheel [
	"in fact, I sould know if this is a wheel, isn't?"
	^  false
]

{ #category : 'accessing' }
GdkSimulatedButtonEvent >> numberPress [

	^ numberPress
]

{ #category : 'accessing' }
GdkSimulatedButtonEvent >> numberPress: aNumber [

	numberPress := aNumber
]

{ #category : 'accessing' }
GdkSimulatedButtonEvent >> position [

	^ position
]

{ #category : 'accessing' }
GdkSimulatedButtonEvent >> position: aPoint [

	position := aPoint
]

{ #category : 'compatibility' }
GdkSimulatedButtonEvent >> state [
	^ self modifierState
]
