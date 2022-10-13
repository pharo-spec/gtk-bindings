Class {
	#name : #GtkEventController,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : #'Gtk4-List'
}

{ #category : #accessing }
GtkEventController >> name [

	self ffiCall: #(char *gtk_event_controller_get_name (self))
]

{ #category : #accessing }
GtkEventController >> name: aName [

	self ffiCall: #(void gtk_event_controller_set_name (self,const char* aName))
]
