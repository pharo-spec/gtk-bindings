"
Used for button press and button release events.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEventButton
"
Class {
	#name : 'GdkButtonEvent',
	#superclass : 'GdkEvent',
	#traits : 'GdkTEventState',
	#classTraits : 'GdkTEventState classTrait',
	#instVars : [
		'button'
	],
	#pools : [
		'GdkButtonType'
	],
	#category : 'Gdk-Events',
	#package : 'Gdk',
	#tag : 'Events'
}

{ #category : 'accessing' }
GdkButtonEvent class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gdk_button_event_get_type())
]

{ #category : 'instance creation' }
GdkButtonEvent class >> newButtonPress [

	self deprecated: #Gtk4
]

{ #category : 'instance creation' }
GdkButtonEvent class >> newButtonRelease [

	self deprecated: #Gtk4
]

{ #category : 'instance creation' }
GdkButtonEvent class >> newRightClick [

	self deprecated: #Gtk4
]

{ #category : 'compatibility' }
GdkButtonEvent >> button [

	^ button ifNil: [ button := self getButton ]
]

{ #category : 'private' }
GdkButtonEvent >> getButton [

	^ self ffiCall: #(guint gdk_button_event_get_button (self))
]

{ #category : 'testing' }
GdkButtonEvent >> isButtonEvent [

	^ true
]

{ #category : 'testing' }
GdkButtonEvent >> isButtonPress [

	^ false
]

{ #category : 'testing' }
GdkButtonEvent >> isButtonRelease [

	^ false
]

{ #category : 'testing' }
GdkButtonEvent >> isDoubleClick [

	self flag: #TODO. "This now has to be controlled with gestures"
	self deprecated: #Gtk4.
	^ false
]

{ #category : 'testing' }
GdkButtonEvent >> isMiddleButton [

	^ self button = GDK_BUTTON_MIDDLE
]

{ #category : 'testing' }
GdkButtonEvent >> isPrimaryButton [

	^ self button = GDK_BUTTON_PRIMARY
]

{ #category : 'testing' }
GdkButtonEvent >> isSecondaryButton [

	^ self button = GDK_BUTTON_SECONDARY
]

{ #category : 'compatibility' }
GdkButtonEvent >> isWheel [
	
	^ false	
]

{ #category : 'compatibility' }
GdkButtonEvent >> state [

	^ self modifierState
]
