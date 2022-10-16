"
GtkEventController is the base class for event controllers.

https://docs.gtk.org/gtk4/class.EventController.html
"
Class {
	#name : #GtkEventController,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : #'Gtk4-Event-Controllers'
}

{ #category : #testing }
GtkEventController >> isClickGesture [

	^ false
	
]

{ #category : #testing }
GtkEventController >> isKeyController [

	^ false

	
]

{ #category : #accessing }
GtkEventController >> name [

	self ffiCall: #(char *gtk_event_controller_get_name (self))
]

{ #category : #accessing }
GtkEventController >> name: aName [

	self ffiCall: #(void gtk_event_controller_set_name (self,const char* aName))
]
