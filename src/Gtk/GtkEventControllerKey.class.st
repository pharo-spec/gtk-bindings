"
GtkEventControllerKey is an event controller that provides access to key events.

https://docs.gtk.org/gtk4/class.EventControllerKey.html
"
Class {
	#name : 'GtkEventControllerKey',
	#superclass : 'GtkEventController',
	#instVars : [
		'imContext'
	],
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'private' }
GtkEventControllerKey class >> gtkNew [

	^ self ffiCall: #(GtkEventControllerKey* gtk_event_controller_key_new (void))
]

{ #category : 'signaling' }
GtkEventControllerKey >> connectKeyPressed: aBlock [
	"aBlock receives a GdkSimulatedKeyPressEvent"

	(GKeyPressedCallback do: aBlock) connectTo: self 
]

{ #category : 'signaling' }
GtkEventControllerKey >> connectKeyReleased: aBlock [
	"aBlock receives a GdkSimulatedKeyPressEvent"

	(GKeyReleasedCallback do: aBlock) connectTo: self 
]

{ #category : 'signaling' }
GtkEventControllerKey >> connectModifiers: aBlock [
	"aBlock receives: a state"

	(GKeyModifiersCallback do: aBlock) connectTo: self 
]

{ #category : 'accessing' }
GtkEventControllerKey >> forwardTo: widget [

	self ffiCall: #(gboolean gtk_event_controller_key_forward (self, GtkWidget* widget))
]

{ #category : 'accessing' }
GtkEventControllerKey >> imContext [

	^ imContext
]

{ #category : 'accessing' }
GtkEventControllerKey >> imContext: anImContext [

	imContext := anImContext.
	self setIMContext: anImContext
]

{ #category : 'testing' }
GtkEventControllerKey >> isKeyController [

	^ true
]

{ #category : 'initialization' }
GtkEventControllerKey >> setIMContext: im_context [

	self ffiCall: #(void gtk_event_controller_key_set_im_context (
  		self,
  		GtkIMContext* im_context))

]
