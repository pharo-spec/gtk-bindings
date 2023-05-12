"
https://docs.gtk.org/gtk4/signal.EventControllerKey.key-released.html
"
Class {
	#name : #GKeyReleasedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Event-Callbacks'
}

{ #category : #signalling }
GKeyReleasedCallback class >> signalName [

	^ 'key-pressed'
]

{ #category : #accessing }
GKeyReleasedCallback >> do: aBlock [

	self
		signature: self signature
		block: [ :widget :keyval :keycode :state :user_data |
			aBlock value: (GdkSimulatedKeyReleaseEvent
				newKeyVal: keyval
				keyCode: keycode
				state: (GdkModifierType newValue: state)) ]
]

{ #category : #accessing }
GKeyReleasedCallback >> signature [

	^ #(void (
		void* widget, 
		guint keyval, 
		guint keycode, 
		"GdkModifierType"int state,
  		gpointer user_data))
]
