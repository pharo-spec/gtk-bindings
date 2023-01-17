"
GtkEventControllerMotion is an event controller tracking the pointer position.

https://docs.gtk.org/gtk4/class.EventControllerMotion.html
"
Class {
	#name : #GtkEventControllerMotion,
	#superclass : #GtkEventController,
	#category : #'Gtk4-Event-Controllers'
}

{ #category : #private }
GtkEventControllerMotion class >> gtkNew [

	^ self ffiCall: #(GtkEventControllerMotion *gtk_event_controller_motion_new ())
]

{ #category : #signaling }
GtkEventControllerMotion >> connectEnter: aBlock [

	(GEnterEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkEventControllerMotion >> connectLeave: aBlock [

	(GLeaveEventCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkEventControllerMotion >> connectMotion: aBlock [

	(GMotionEventCallback do: aBlock) connectTo: self
]

{ #category : #testing }
GtkEventControllerMotion >> containsPointer [

	self ffiCall: #(gboolean gtk_event_controller_motion_contains_pointer (self))
]

{ #category : #testing }
GtkEventControllerMotion >> isMotionController [

	^ true
]

{ #category : #testing }
GtkEventControllerMotion >> isPointer [

	^ self ffiCall: #(gboolean gtk_event_controller_motion_is_pointer (self))
]
