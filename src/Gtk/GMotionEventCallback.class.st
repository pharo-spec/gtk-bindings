"
https://docs.gtk.org/gtk4/signal.EventControllerMotion.motion.html
"
Class {
	#name : #GMotionEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Callbacks'
}

{ #category : #signalling }
GMotionEventCallback class >> signalName [

	^ 'motion'
]

{ #category : #accessing }
GMotionEventCallback >> do: aBlock [

	super do: [ :widget :x :y :user_data |
		aBlock value: (GdkSimulatedMotionEvent newPosition: x@y) ]
]

{ #category : #accessing }
GMotionEventCallback >> signature [

	^ #(void (void *widget, gdouble x, gdouble y, gpointer user_data))
]
