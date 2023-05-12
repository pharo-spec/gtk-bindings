Class {
	#name : #GtkKeyReleaseEventTest,
	#superclass : #GtkKeyEventTest,
	#pools : [
		'GdkKeyCodes'
	],
	#category : #'Gtk-Tests-Events'
}

{ #category : #accessing }
GtkKeyReleaseEventTest >> classToTest [

	^ GdkSimulatedKeyReleaseEvent
]
