Class {
	#name : #GtkPanedTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk4-Tests-Widget'
}

{ #category : #'instance creation' }
GtkPanedTest >> newWidget [

	^ self widgetClass newVertical
]

{ #category : #accessing }
GtkPanedTest >> widgetClass [

	^ GtkPaned
]
