Class {
	#name : #GtkFormViewTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk-Morphic-Tests'
}

{ #category : #'instance creation' }
GtkFormViewTest >> newWidget [

	^ self widgetClass new
		form: (Smalltalk ui icons iconNamed: #pharoBig);
		yourself
]

{ #category : #tests }
GtkFormViewTest >> testPassing [
]

{ #category : #tests }
GtkFormViewTest >> testWithFailure [

	self assert: false
]

{ #category : #accessing }
GtkFormViewTest >> widgetClass [

	^ GtkFormView
]
