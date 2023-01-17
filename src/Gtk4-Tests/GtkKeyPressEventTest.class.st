Class {
	#name : #GtkKeyPressEventTest,
	#superclass : #GtkKeyEventTest,
	#category : #'Gtk4-Tests-Events'
}

{ #category : #accessing }
GtkKeyPressEventTest >> classToTest [

	^ GdkSimulatedKeyPressEvent
]
