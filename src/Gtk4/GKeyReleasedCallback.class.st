"
https://docs.gtk.org/gtk4/signal.EventControllerKey.key-released.html
"
Class {
	#name : #GKeyReleasedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk4-Event-Callbacks'
}

{ #category : #signalling }
GKeyReleasedCallback class >> signalName [

	^ 'key-pressed'
]

{ #category : #enumerating }
GKeyReleasedCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :keyval :keycode :state :user_data | 
			aBlock value: (GtkKeyReleaseEvent 
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