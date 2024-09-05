Class {
	#name : 'GtkKeyPressEventTest',
	#superclass : 'GtkKeyEventTest',
	#category : 'Gtk-Tests-Events',
	#package : 'Gtk-Tests',
	#tag : 'Events'
}

{ #category : 'accessing' }
GtkKeyPressEventTest >> classToTest [

	^ GdkSimulatedKeyPressEvent
]
