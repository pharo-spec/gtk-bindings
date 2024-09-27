"
GtkEventControllerMotion is an event controller tracking the pointer position.

https://docs.gtk.org/gtk4/class.EventControllerMotion.html
"
Class {
	#name : 'GtkEventControllerMotion',
	#superclass : 'GtkEventController',
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'private' }
GtkEventControllerMotion class >> gtkNew [

	^ self ffiCall: #(GtkEventControllerMotion *gtk_event_controller_motion_new ())
]

{ #category : 'signaling' }
GtkEventControllerMotion >> connectEnter: aBlock [

	(GFocusEnterEventCallback do: aBlock) connectTo: self
]

{ #category : 'signaling' }
GtkEventControllerMotion >> connectLeave: aBlock [

	(GFocusLeaveEventCallback do: aBlock) connectTo: self
]

{ #category : 'signaling' }
GtkEventControllerMotion >> connectMotion: aBlock [

	(GMotionEventCallback do: [ :controllerHandle :x :y :user_data | 
		aBlock 
			value: x 
			value: y 
			value: self ]) 
		connectTo: self
]

{ #category : 'testing' }
GtkEventControllerMotion >> containsPointer [

	self ffiCall: #(gboolean gtk_event_controller_motion_contains_pointer (self))
]

{ #category : 'testing' }
GtkEventControllerMotion >> isMotionController [

	^ true
]

{ #category : 'testing' }
GtkEventControllerMotion >> isPointer [

	^ self ffiCall: #(gboolean gtk_event_controller_motion_is_pointer (self))
]
