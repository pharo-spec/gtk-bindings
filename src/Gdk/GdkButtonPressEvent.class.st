Class {
	#name : 'GdkButtonPressEvent',
	#superclass : 'GdkButtonEvent',
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'testing' }
GdkButtonPressEvent class >> isType: aType [ 

	^ { 
		GDK_BUTTON_PRESS. 
		GDK_2BUTTON_PRESS.
		GDK_3BUTTON_PRESS.
	 }
	includes: aType
]

{ #category : 'visiting' }
GdkButtonPressEvent >> accept: aVisitor [

	^ aVisitor visitMouseButtonPressEvent: self
]

{ #category : 'testing' }
GdkButtonPressEvent >> isButtonPress [

	^ true
]
