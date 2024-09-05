Class {
	#name : 'GdkKeyPressEvent',
	#superclass : 'GdkKeyEvent',
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'testing' }
GdkKeyPressEvent class >> isType: aType [

	^ aType = GDK_KEY_PRESS
]

{ #category : 'visiting' }
GdkKeyPressEvent >> accept: aVisitor [

	^ aVisitor visitKeyDownEvent: self
]

{ #category : 'testing' }
GdkKeyPressEvent >> isKeyPress [

	^ true
]
