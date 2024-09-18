"
Simulate a `GdkKeyPressEvent`
"
Class {
	#name : 'GdkSimulatedKeyPressEvent',
	#superclass : 'GdkSimulatedKeyEvent',
	#category : 'Gtk-Events-Simulated',
	#package : 'Gtk',
	#tag : 'Events-Simulated'
}

{ #category : 'visiting' }
GdkSimulatedKeyPressEvent >> accept: aVisitor [

	^ aVisitor visitKeyDownEvent: self
]

{ #category : 'testing' }
GdkSimulatedKeyPressEvent >> isKeyPress [

	^ true
]
