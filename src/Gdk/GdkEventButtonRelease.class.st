Class {
	#name : #GdkEventButtonRelease,
	#superclass : #GdkEventButton,
	#category : #'Gdk-Events'
}

{ #category : #testing }
GdkEventButtonRelease class >> isType: aType [

	^ aType = GDK_BUTTON_RELEASE
]

{ #category : #visiting }
GdkEventButtonRelease >> accept: aVisitor [
 
	^ aVisitor visitMouseButtonReleaseEvent: self
]

{ #category : #testing }
GdkEventButtonRelease >> isButtonRelease [

	^ true
]
