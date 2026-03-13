Class {
	#name : 'GtkKeyReleaseEventTest',
	#superclass : 'GtkKeyEventTest',
	#pools : [
		'GdkKeyCodes'
	],
	#category : 'Gtk-Tests-Events',
	#package : 'Gtk-Tests',
	#tag : 'Events'
}

{ #category : 'accessing' }
GtkKeyReleaseEventTest >> classToTest [

	^ GdkSimulatedKeyReleaseEvent
]
