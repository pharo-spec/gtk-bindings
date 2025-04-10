"
https://docs.gtk.org/gtk4/signal.EventControllerMotion.motion.html
"
Class {
	#name : 'GMotionEventCallback',
	#superclass : 'GManagedSignalCallback',
	#instVars : [
		'controller'
	],
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

	super do: [ :controllerHandle :x :y :user_data |
		aBlock value: (GdkSimulatedMotionEvent 
			newController: (controller 
				ifNil: [ GtkEventControllerMotion fromHandleUnreferenced: controllerHandle ]) 
			position: x@y) ]

]

{ #category : 'accessing' }
GMotionEventCallback >> signature [

	^ #(void (void *widget, gdouble x, gdouble y, gpointer user_data))
]
