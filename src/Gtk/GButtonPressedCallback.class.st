"
Emitted whenever a button or touch press happens.

https://docs.gtk.org/gtk4/signal.GestureClick.pressed.html
"
Class {
	#name : 'GButtonPressedCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'Gtk-Event-Callbacks',
	#package : 'Gtk',
	#tag : 'Event-Callbacks'
}

{ #category : 'signalling' }
GButtonPressedCallback class >> signalName [

	^ 'pressed'
]

{ #category : 'enumerating' }
GButtonPressedCallback >> do: aBlock [ 

	super do: [ :gesture :n_press :x :y :user_data |
		aBlock cull: (GdkSimulatedButtonPressEvent 
			newPosition: x@y
			numberPress: n_press) ]
]

{ #category : 'accessing' }
GButtonPressedCallback >> signature [

	^ #(void (void *gesture, gint n_press, gdouble x, gdouble y, gpointer user_data))
]
