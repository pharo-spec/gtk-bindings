"
https://docs.gtk.org/gtk4/signal.EventControllerMotion.leave.html
https://docs.gtk.org/gtk4/signal.EventControllerFocus.leave.html
"
Class {
	#name : #GFocusLeaveEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Callbacks'
}

{ #category : #signalling }
GFocusLeaveEventCallback class >> signalName [

	^ 'leave'
]

{ #category : #accessing }
GFocusLeaveEventCallback >> do: aBlock [

	super do: [ :widget :user_data |
		aBlock value: GdkSimulatedCrossingLeaveEvent new ]
]

{ #category : #accessing }
GFocusLeaveEventCallback >> signature [

	^ #(void (void *widget, gpointer user_data))
]
