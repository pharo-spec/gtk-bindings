"
Emitted whenever the state of modifier keys and pointer buttons change.

https://docs.gtk.org/gtk4/signal.EventControllerKey.modifiers.html
"
Class {
	#name : 'GKeyModifiersCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'Gtk-Event-Callbacks',
	#package : 'Gtk',
	#tag : 'Event-Callbacks'
}

{ #category : 'signalling' }
GKeyModifiersCallback class >> signalName [

	^ 'modifiers'
]

{ #category : 'enumerating' }
GKeyModifiersCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :modifiers :user_data | 
			aBlock value: (GdkModifierType newValue: modifiers).
			false ]
]

{ #category : 'accessing' }
GKeyModifiersCallback >> signature [

	^ #(void (
		void* widget, 
		"GdkModifierType"int modifiers,
  		gpointer user_data))
]
