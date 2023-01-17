"
https://docs.gtk.org/gtk4/signal.EventControllerMotion.leave.html
"
Class {
	#name : #GLeaveEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Callbacks'
}

{ #category : #signalling }
GLeaveEventCallback class >> signalName [

	^ 'leave'
]

{ #category : #accessing }
GLeaveEventCallback >> do: aBlock [

	super do: [ :widget :user_data |
		aBlock value: GdkSimulatedCrossingLeaveEvent new ]
]

{ #category : #accessing }
GLeaveEventCallback >> signature [

	^ #(void (void *widget, gpointer user_data))
]
