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

{ #category : #accessing }
GtkEventController >> currentDevice [

	^ self ffiCall: #(GdkDevice* gtk_event_controller_get_current_event_device (self))
]

{ #category : #accessing }
GtkEventController >> currentEvent [

	^ self ffiCall: #(GdkEvent* gtk_event_controller_get_current_event (self))
]

{ #category : #accessing }
GtkEventController >> currentEventState [

	^ self ffiCall: #(GdkModifierType gtk_event_controller_get_current_event_state (self))
]

{ #category : #accessing }
GtkEventController >> currentEventTime [

	^ self ffiCall: #(guint32 gtk_event_controller_get_current_event_time (self))
]

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