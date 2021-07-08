"
Used for button press and button release events.

https://developer.gnome.org/gdk3/stable/gdk3-Event-Structures.html#GdkEventButton
"
Class {
	#name : #GdkEventButton,
	#superclass : #GdkEvent,
	#traits : 'TGdkEventState',
	#classTraits : 'TGdkEventState classTrait',
	#classVars : [
		'OFFSET_AXES',
		'OFFSET_BUTTON',
		'OFFSET_DEVICE',
		'OFFSET_SEND_EVENT',
		'OFFSET_STATE',
		'OFFSET_TIME',
		'OFFSET_TYPE',
		'OFFSET_WINDOW',
		'OFFSET_X',
		'OFFSET_X_ROOT',
		'OFFSET_Y',
		'OFFSET_Y_ROOT'
	],
	#pools : [
		'GdkButtonType'
	],
	#category : #'Gtk-Base-Events'
}
