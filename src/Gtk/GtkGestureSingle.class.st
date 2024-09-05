"
GtkGestureSingle is a GtkGestures subclass optimized for singe-touch and mouse gestures.

https://docs.gtk.org/gtk4/class.GestureSingle.html
"
Class {
	#name : 'GtkGestureSingle',
	#superclass : 'GtkGesture',
	#pools : [
		'GdkButtonType'
	],
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'accessing' }
GtkGestureSingle >> beButtonAny [

	self button: GDK_BUTTON_ANY
]

{ #category : 'accessing' }
GtkGestureSingle >> beButtonMiddle [

	self button: GDK_BUTTON_MIDDLE
]

{ #category : 'accessing' }
GtkGestureSingle >> beButtonPrimary [

	self button: GDK_BUTTON_PRIMARY
]

{ #category : 'accessing' }
GtkGestureSingle >> beButtonSecondary [

	self button: GDK_BUTTON_SECONDARY
]

{ #category : 'accessing' }
GtkGestureSingle >> button: button [

	self ffiCall: #(void gtk_gesture_single_set_button (self, guint button))
]
