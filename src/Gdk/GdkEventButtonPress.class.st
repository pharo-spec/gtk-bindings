Class {
	#name : #GdkEventButtonPress,
	#superclass : #GdkEventButton,
	#category : #'Gdk-Events'
}

{ #category : #testing }
GdkEventButtonPress class >> isType: aType [ 

	^ { 
		GDK_BUTTON_PRESS. 
		GDK_2BUTTON_PRESS.
		GDK_3BUTTON_PRESS.
	 }
	includes: aType
]

{ #category : #visiting }
GdkEventButtonPress >> accept: aVisitor [

	^ aVisitor visitMouseButtonPressEvent: self
]

{ #category : #testing }
GdkEventButtonPress >> isButtonPress [

	^ true
]
