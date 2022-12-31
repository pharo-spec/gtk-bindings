Class {
	#name : #GtkFormViewTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk4-Morphic-Tests'
}

{ #category : #'instance creation' }
GtkFormViewTest >> newWidget [

	^ self widgetClass 
		form: (Smalltalk ui icons iconNamed: #pharoBig);
		yourself
]

{ #category : #accessing }
GtkFormViewTest >> widgetClass [

	^ GtkFormView
]
