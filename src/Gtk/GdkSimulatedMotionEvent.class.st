"
Simulate a `GdkMotionEvent`
"
Class {
	#name : 'GdkSimulatedMotionEvent',
	#superclass : 'GdkSimulatedEvent',
	#instVars : [
		'position',
		'controller'
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

{ #category : 'accessing' }
GdkSimulatedMotionEvent >> controller [

	^ controller
]

{ #category : 'accessing' }
GdkSimulatedMotionEvent >> controller: aMotionController [

	controller := aMotionController
]

{ #category : 'testing' }
GdkSimulatedMotionEvent >> hasButton1Modifier [
	
	self controller ifNil: [ ^ false ]. 
	
	^ (self controller currentEventState & GdkModifierType GDK_BUTTON1_MASK) = GdkModifierType GDK_BUTTON1_MASK
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
