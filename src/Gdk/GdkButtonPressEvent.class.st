Class {
	#name : 'GdkButtonPressEvent',
	#superclass : 'GdkButtonEvent',
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'testing' }
GdkButtonPressEvent class >> isType: aType [ 

	^ aType = GDK_BUTTON_PRESS
]

{ #category : 'visiting' }
GdkButtonPressEvent >> accept: aVisitor [

	^ aVisitor visitMouseButtonPressEvent: self
]

{ #category : 'testing' }
GdkButtonPressEvent >> isButtonPress [

	^ true
]
