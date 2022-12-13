Class {
	#name : #GdkButtonReleaseEvent,
	#superclass : #GdkButtonEvent,
	#category : #'Gdk-Events'
}

{ #category : #testing }
GdkButtonReleaseEvent class >> isType: aType [

	^ aType = GDK_BUTTON_RELEASE
]

{ #category : #visiting }
GdkButtonReleaseEvent >> accept: aVisitor [
 
	^ aVisitor visitMouseButtonReleaseEvent: self
]

{ #category : #testing }
GdkButtonReleaseEvent >> isButtonRelease [

	^ true
]
