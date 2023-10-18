"
https://docs.gtk.org/gtk4/class.EventControllerScroll.html
"
Class {
	#name : 'GtkEventControllerScroll',
	#superclass : 'GtkEventController',
	#pools : [
		'GtkEventControllerScrollFlags'
	],
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'private' }
GtkEventControllerScroll class >> gtkNew [

	^ self ffiCall: #(GtkEventControllerScroll* gtk_event_controller_scroll_new ("GtkEventControllerScrollFlags"uint 0))
]

{ #category : 'accessing' }
GtkEventControllerScroll >> beHorizontal [
	"but there are many other flags. Maybe easier to use #flags: directly"

	self flags: GTK_EVENT_CONTROLLER_SCROLL_VERTICAL
]

{ #category : 'accessing' }
GtkEventControllerScroll >> beVertical [
	"but there are many other flags. Maybe easier to use #flags: directly"

	self flags: GTK_EVENT_CONTROLLER_SCROLL_VERTICAL
]

{ #category : 'signaling' }
GtkEventControllerScroll >> connectScroll: aBlock [
	"connects to scroll signal.
	 aBlock needs to answer a boolean to stop or not event propagation"

	(GScrollEventCallback do: aBlock) connectTo: self
]

{ #category : 'accessing' }
GtkEventControllerScroll >> flags [

	self ffiCall: #(GtkEventControllerScrollFlags gtk_event_controller_scroll_get_flags (self))
]

{ #category : 'accessing' }
GtkEventControllerScroll >> flags: flags [

	self ffiCall: #(void gtk_event_controller_scroll_set_flags (
		self, 
		GtkEventControllerScrollFlags flags))
]

{ #category : 'testing' }
GtkEventControllerScroll >> isScrollController [

	^ true
]
