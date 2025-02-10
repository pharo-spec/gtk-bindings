"
Simulate a `GdkMotionEvent`
"
Class {
	#name : 'GdkSimulatedMotionEvent',
	#superclass : 'GdkSimulatedEvent',
	#traits : 'GdkTEventState',
	#classTraits : 'GdkTEventState classTrait',
	#instVars : [
		'position'
	],
	#category : 'Gtk-Events-Simulated',
	#package : 'Gtk',
	#tag : 'Events-Simulated'
}

{ #category : 'instance creation' }
GdkSimulatedMotionEvent class >> newController: aController position: aPoint [

	^ self new
		controller: aController;
		position: aPoint;
		yourself
]

{ #category : 'instance creation' }
GdkSimulatedMotionEvent class >> newPosition: aPoint [

	^ self new
		position: aPoint;
		yourself
]

{ #category : 'visiting' }
GdkSimulatedMotionEvent >> accept: aVisitor [

	^ aVisitor visitMouseMoveEvent: self
]

{ #category : 'testing' }
GdkSimulatedMotionEvent >> isMotionEvent [

	^ true
]

{ #category : 'accessing' }
GdkSimulatedMotionEvent >> position [

	^ position
]

{ #category : 'accessing' }
GdkSimulatedMotionEvent >> position: aPoint [

	position := aPoint
]

{ #category : 'accessing' }
GdkSimulatedMotionEvent >> state [

	^ self modifierState
]
