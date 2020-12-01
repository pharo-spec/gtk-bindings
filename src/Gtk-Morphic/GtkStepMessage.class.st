"
I'm a recurrent alarm. 
I'm used to implement the steping property of morphs in the context of a GtkMorphView.
"
Class {
	#name : #GtkStepMessage,
	#superclass : #StepMessage,
	#category : #'Gtk-Morphic'
}

{ #category : #scheduling }
GtkStepMessage >> cancel [

	GtkMorphicStepService uniqueInstance unregister: self
]

{ #category : #scheduling }
GtkStepMessage >> schedule [

	GtkMorphicStepService uniqueInstance register: self
]

{ #category : #scheduling }
GtkStepMessage >> step [

	self value: Time millisecondClockValue
]

{ #category : #accessing }
GtkStepMessage >> stepTime [

	^ super stepTime 
		ifNil: [ self receiver stepTime ]
]

{ #category : #private }
GtkStepMessage >> waitUntilExecution [

	self stepTime milliSeconds wait
]
