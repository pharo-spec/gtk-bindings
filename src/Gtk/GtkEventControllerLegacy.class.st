"
https://docs.gtk.org/gtk4/class.EventControllerLegacy.html
"
Class {
	#name : 'GtkEventControllerLegacy',
	#superclass : 'GtkEventController',
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'private' }
GtkEventControllerLegacy class >> gtkNew [

	^ self ffiCall: #(GtkEventControllerLegacy *gtk_event_controller_legacy_new (void))
]

{ #category : 'signaling' }
GtkEventControllerLegacy >> connectEvent: aBlock [

	(GEventCallback do: aBlock) connectTo: self 
]
