"
Emitted when a button or touch is released.

https://docs.gtk.org/gtk4/signal.GestureClick.released.html
"
Class {
	#name : #GButtonReleasedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Event-Callbacks'
}

{ #category : #signalling }
GButtonReleasedCallback class >> signalName [

	^ 'released'
]

{ #category : #enumerating }
GButtonReleasedCallback >> do: aBlock [ 

	super do: [ :gesture :n_press :x :y :user_data |
		aBlock cull: (GdkSimulatedButtonReleaseEvent 
			newPosition: x@y
			numberPress: n_press) ]
]

{ #category : #accessing }
GButtonReleasedCallback >> signature [

	^ #(void (void *gesture, gint n_press, gdouble x, gdouble y, gpointer user_data))
]
