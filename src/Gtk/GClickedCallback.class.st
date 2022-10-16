"
The “clicked” signal

void
user_function (GtkButton *button,
               gpointer   user_data)

Emitted when the button has been activated (pressed and released).
"
Class {
	#name : #GClickedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Callbacks'
}

{ #category : #testing }
GClickedCallback class >> isDeprecated [

	^ true
]

{ #category : #accessing }
GClickedCallback class >> signalName [

	^ 'clicked'
]

{ #category : #accessing }
GClickedCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :user_data | aBlock value ]
]
