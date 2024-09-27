"
https://docs.gtk.org/gtk4/signal.EventControllerMotion.motion.html
"
Class {
	#name : 'GMotionEventCallback',
	#superclass : 'GManagedSignalCallback',
	#pools : [
		'GObjectTypes'
	],
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'signalling' }
GMotionEventCallback class >> signalName [

	^ 'motion'
]

{ #category : 'accessing' }
GMotionEventCallback >> do: aBlock [

	"connectMotion: does some transforms to be able to pass the controller"
	super do: [ :x :y :controller |
		aBlock value: (GdkSimulatedMotionEvent newController: controller position: x@y) ]
]

{ #category : 'accessing' }
GMotionEventCallback >> signature [

	^ #(void (void *widget, gdouble x, gdouble y, gpointer user_data))
]
