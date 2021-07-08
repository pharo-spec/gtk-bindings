"
Describes a key press or key release event.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEventKey
"
Class {
	#name : #GdkEventKey,
	#superclass : #GdkEvent,
	#traits : 'TGdkEventState',
	#classTraits : 'TGdkEventState classTrait',
	#instVars : [
		'keyValue',
		'position',
		'key'
	],
	#classVars : [
		'InternalMap',
		'OFFSET_GROUP',
		'OFFSET_HARDWARE_KEYCODE',
		'OFFSET_IS_MODIFIER',
		'OFFSET_KEYVAL',
		'OFFSET_LENGTH',
		'OFFSET_SEND_EVENT',
		'OFFSET_STATE',
		'OFFSET_STRING',
		'OFFSET_TIME',
		'OFFSET_TYPE',
		'OFFSET_WINDOW'
	],
	#pools : [
		'GdkKeyCodes',
		'GdkModifierType'
	],
	#category : #'Gtk-Base-Events'
}
