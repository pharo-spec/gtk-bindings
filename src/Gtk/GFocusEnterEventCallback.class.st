"
https://docs.gtk.org/gtk4/signal.EventControllerMotion.enter.html
https://docs.gtk.org/gtk4/signal.EventControllerFocus.leave.html
"
Class {
	#name : 'GFocusEnterEventCallback',
	#superclass : 'GManagedSignalCallback',
	#pools : [
		'GObjectTypes'
	],
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'signalling' }
GFocusEnterEventCallback class >> signalName [

	^ 'enter'
]

{ #category : 'accessing' }
GFocusEnterEventCallback >> do: aBlock [

	super do: [ :widget :user_data |
		aBlock value: GdkSimulatedCrossingEnterEvent new ]
]

{ #category : 'accessing' }
GFocusEnterEventCallback >> signature [

	^ #(void (void *widget, gpointer user_data))
]
