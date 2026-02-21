"
A GSimpleAction is the obvious simple implementation of the GAction interface. This is the easiest way to create an action for purposes of adding it to a GSimpleActionGroup.

https://docs.gtk.org/gio/class.SimpleAction.html
"
Class {
	#name : 'GSimpleAction',
	#superclass : 'GObject',
	#traits : 'GLibIOTLibrary + GTAction',
	#classTraits : 'GLibIOTLibrary classTrait + GTAction classTrait',
	#category : 'Gtk-Widget-Menu',
	#package : 'Gtk',
	#tag : 'Widget-Menu'
}

{ #category : 'private' }
GSimpleAction class >> gNew: aName [

	^ self ffiCall: #(GSimpleAction* g_simple_action_new (gchar* aName, NULL))
]

{ #category : 'private' }
GSimpleAction class >> gNewStateful: aName state: aState [

	self ffiCall: #(GSimpleAction* g_simple_action_new_stateful (
  		const gchar* aName,
  		"const GVariantType* parameter_type"NULL,
  		GVariant* aState))
]

{ #category : 'instance creation' }
GSimpleAction class >> newName: aName [ 

	^ (self gNew: aName) initialize
]

{ #category : 'instance creation' }
GSimpleAction class >> newNameStateful: aName [ 

	^ self newNameStateful: aName state: false
]

{ #category : 'instance creation' }
GSimpleAction class >> newNameStateful: aName state: aBoolean [ 
	| instance variant |

	variant := GVariant newBoolean: aBoolean.
	instance := (self gNewStateful: aName state: variant) initialize.
		
	^ instance
]

{ #category : 'activation' }
GSimpleAction >> activate [

	self ffiCall: #(void g_action_activate (self, NULL))
]

{ #category : 'signaling' }
GSimpleAction >> connectActivate: aBlock [
	"aBlock receives NO arguments"

	(GActionActivateCallback do: aBlock) connectTo: self
]

{ #category : 'accessing' }
GSimpleAction >> enable: enabled [

	self ffiCall: #(void g_simple_action_set_enabled (self, gboolean enabled))
]

{ #category : 'testing' }
GSimpleAction >> isEnabled [

	^ self gObjectGetBoolean: 'enabled'
]
