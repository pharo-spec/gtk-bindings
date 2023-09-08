"
GtkEventController is the base class for event controllers.

https://docs.gtk.org/gtk4/class.EventController.html
"
Class {
	#name : #GtkEventController,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : #'Gtk-Event-Controllers'
}

{ #category : #private }
GtkEventController class >> gtkNew [

	self subclassResponsibility
]

{ #category : #'instance creation' }
GtkEventController class >> new [

	^ self gtkNew initialize
]

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
GtkEventController >> isFocusController [

	^ false
]

{ #category : #testing }
GtkEventController >> isGestureClick [

	^ false
]

{ #category : #testing }
GtkEventController >> isKeyController [

	^ false

	
]

{ #category : #testing }
GtkEventController >> isMotionController [

	^ false
]

{ #category : #testing }
GtkEventController >> isScrollController [

	^ false
]

{ #category : #testing }
GtkEventController >> isShortcutController [

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

{ #category : #accessing }
GtkEventController >> reset [

	self ffiCall: #(void gtk_event_controller_reset (self))
]
