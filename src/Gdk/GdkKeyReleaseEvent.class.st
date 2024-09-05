Class {
	#name : 'GdkKeyReleaseEvent',
	#superclass : 'GdkKeyEvent',
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'testing' }
GdkKeyReleaseEvent class >> isType: aType [ 

	^ aType = GDK_KEY_RELEASE
]

{ #category : 'visiting' }
GdkKeyReleaseEvent >> accept: aVisitor [

	^ aVisitor visitKeyUpEvent: self
]

{ #category : 'testing' }
GdkKeyReleaseEvent >> isKeyRelease [

	^ true
]
