"
https://docs.gtk.org/gtk4/signal.EventControllerKey.key-pressed.html
"
Class {
	#name : #GKeyPressedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk4-Event-Callbacks'
}

{ #category : #signalling }
GKeyPressedCallback class >> signalName [

	^ 'key-pressed'
]

{ #category : #accessing }
GKeyPressedCallback >> do: aBlock [

	self
		signature: self signature
		block: [ :widget :keyval :keycode :state :user_data | | event |
			"it should answer a boolean (processed)"
			event := GdkSimulatedKeyPressEvent
				newKeyVal: keyval
				keyCode: keycode
				state: (GdkModifierType newValue: state).
			aBlock value: event.
			event wasHandled ]
]

{ #category : #accessing }
GKeyPressedCallback >> signature [

	^ #(gboolean (
		void* widget, 
		guint keyval, 
		guint keycode, 
		"GdkModifierType"int state,
  		gpointer user_data))
]
