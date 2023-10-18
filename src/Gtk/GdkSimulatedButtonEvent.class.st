Class {
	#name : 'GdkSimulatedButtonEvent',
	#superclass : 'GdkSimulatedEvent',
	#instVars : [
		'position',
		'numberPress'
	],
	#category : 'Gtk-Events-Simulated',
	#package : 'Gtk',
	#tag : 'Events-Simulated'
}

{ #category : 'instance creation' }
GdkSimulatedButtonEvent class >> newPosition: aPoint numberPress: aNumber [

	^ self new 
		position: aPoint;
		numberPress: aNumber;
		yourself
]

{ #category : 'visiting' }
GdkSimulatedButtonEvent >> accept: aVisitor [

	^ aVisitor visitMouseButtonPressEvent: self
]

{ #category : 'testing' }
GdkSimulatedButtonEvent >> isButtonEvent [

	^ true
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
