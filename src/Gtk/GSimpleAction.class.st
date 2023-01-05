"
A GSimpleAction is the obvious simple implementation of the GAction interface. This is the easiest way to create an action for purposes of adding it to a GSimpleActionGroup.

https://docs.gtk.org/gio/class.SimpleAction.html
"
Class {
	#name : #GSimpleAction,
	#superclass : #GObject,
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : #'Gtk-Widget-Menu'
}

{ #category : #private }
GSimpleAction class >> gNew: aName [

	^ self ffiCall: #(GSimpleAction* g_simple_action_new (gchar* aName, NULL))
]

{ #category : #'instance creation' }
GSimpleAction class >> newName: aName [ 

	^ (self gNew: aName) initialize
]

{ #category : #signaling }
GSimpleAction >> connectActivate: aBlock [
	"aBlock receives NO arguments"

	(GActionActivateCallback do: aBlock) connectTo: self
]

{ #category : #accessing }
GSimpleAction >> enable: enabled [

	self ffiCall: #(void g_simple_action_set_enabled (self, gboolean enabled))
]

{ #category : #testing }
GSimpleAction >> isEnabled [

	^ self gObjectGetBoolean: 'enabled'
]

{ #category : #accessing }
GSimpleAction >> name [

	^ self gObjectGetString: 'name'
]
