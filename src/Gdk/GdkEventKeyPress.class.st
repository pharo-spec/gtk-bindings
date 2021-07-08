Class {
	#name : #GdkEventKeyPress,
	#superclass : #GdkEventKey,
	#category : #'Gdk-Events'
}

{ #category : #testing }
GdkEventKeyPress class >> isType: aType [

	^ aType = GDK_KEY_PRESS
]

{ #category : #visiting }
GdkEventKeyPress >> accept: aVisitor [

	^ aVisitor visitKeyDownEvent: self
]

{ #category : #testing }
GdkEventKeyPress >> isKeyPress [

	^ true
]
