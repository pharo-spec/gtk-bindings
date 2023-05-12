Class {
	#name : #GtkPanedTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk-Tests-Widget'
}

{ #category : #'instance creation' }
GtkPanedTest >> newWidget [

	^ self widgetClass newVertical
]

{ #category : #accessing }
GtkPanedTest >> widgetClass [

	^ GtkPaned
]
