"
https://docs.gtk.org/gtk4/signal.EventControllerMotion.enter.html
"
Class {
	#name : #GEnterEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Callbacks'
}

{ #category : #signalling }
GEnterEventCallback class >> signalName [

	^ 'enter'
]

{ #category : #accessing }
GEnterEventCallback >> do: aBlock [

	super do: [ :widget :user_data |
		aBlock value: GdkSimulatedCrossingEnterEvent new ]
]

{ #category : #accessing }
GEnterEventCallback >> signature [

	^ #(void (void *widget, gpointer user_data))
]
