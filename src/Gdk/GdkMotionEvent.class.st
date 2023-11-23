"
struct GdkEventMotion

Generated when the pointer moves.
"
Class {
	#name : 'GdkMotionEvent',
	#superclass : 'GdkEvent',
	#traits : 'GdkTEventState',
	#classTraits : 'GdkTEventState classTrait',
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'testing' }
GdkMotionEvent class >> isType: aType [

	^ aType = GDK_MOTION_NOTIFY
]

{ #category : 'visiting' }
GdkMotionEvent >> accept: aVisitor [

	^ aVisitor visitMouseMoveEvent: self
]

{ #category : 'testing' }
GdkMotionEvent >> isMotionEvent [

	^ true
]

{ #category : 'compatibility' }
GdkMotionEvent >> state [
	
	^ self modifierState
]
