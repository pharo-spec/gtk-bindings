Class {
	#name : #GtkGestureSingle,
	#superclass : #GtkGesture,
	#pools : [
		'GdkButtonType'
	],
	#category : #'Gtk4-List'
}

{ #category : #accessing }
GtkGestureSingle >> beButtonMiddle [

	self button: GDK_BUTTON_MIDDLE
]

{ #category : #accessing }
GtkGestureSingle >> beButtonPrimary [

	self button: GDK_BUTTON_PRIMARY
]

{ #category : #accessing }
GtkGestureSingle >> beButtonSecondary [

	self button: GDK_BUTTON_SECONDARY
]

{ #category : #accessing }
GtkGestureSingle >> button: button [

	self ffiCall: #(void gtk_gesture_single_set_button (self, guint button))
]
