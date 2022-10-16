Class {
	#name : #GtkKeyReleaseEventTest,
	#superclass : #GtkKeyEventTest,
	#pools : [
		'GdkKeyCodes'
	],
	#category : #'Gtk4-Tests-Events'
}

{ #category : #accessing }
GtkKeyReleaseEventTest >> classToTest [

	^ GtkKeyReleaseEvent
]
