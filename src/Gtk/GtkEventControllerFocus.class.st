"
https://docs.gtk.org/gtk4/class.EventControllerFocus.html
"
Class {
	#name : 'GtkEventControllerFocus',
	#superclass : 'GtkEventController',
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'private' }
GtkEventControllerFocus class >> gtkNew [

	^ self ffiCall: #(GtkEventControllerFocus* gtk_event_controller_focus_new (void))
]

{ #category : 'signaling' }
GtkEventControllerFocus >> connectEnter: aBlock [
	"aBlock receives zero arguments"

	(GFocusEnterEventCallback do: aBlock) connectTo: self
]

{ #category : 'signaling' }
GtkEventControllerFocus >> connectLeave: aBlock [
	"aBlock receives zero arguments"

	(GFocusEnterEventCallback do: aBlock) connectTo: self
]

{ #category : 'testing' }
GtkEventControllerFocus >> containsFocus [

	^ self ffiCall: #(gboolean gtk_event_controller_focus_contains_focus (self))
]

{ #category : 'testing' }
GtkEventControllerFocus >> isFocus [

	^ self ffiCall: #(gboolean gtk_event_controller_focus_is_focus (self))

]

{ #category : 'testing' }
GtkEventControllerFocus >> isFocusController [

	^ true
]
