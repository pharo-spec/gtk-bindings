Class {
	#name : #GtkKeyPressEventTest,
	#superclass : #GtkKeyEventTest,
	#category : #'Gtk-Tests-Events'
}

{ #category : #accessing }
GtkKeyPressEventTest >> classToTest [

	^ GdkSimulatedKeyPressEvent
]
