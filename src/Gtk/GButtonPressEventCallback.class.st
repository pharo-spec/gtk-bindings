Class {
	#name : 'GButtonPressEventCallback',
	#superclass : 'GManagedSignalCallback',
	#pools : [
		'GtkTypes'
	],
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'testing' }
GButtonPressEventCallback class >> isDeprecated [

	^ true
]

{ #category : 'accessing' }
GButtonPressEventCallback class >> signalName [

	^ 'button-press-event'
]

{ #category : 'accessing' }
GButtonPressEventCallback >> do: aBlock [
	
	self
		signature: self signature
		block: [ :widget :event :aData | 
			aBlock cull: (GdkButtonEvent fromHandle: event) ]
]

{ #category : 'accessing' }
GButtonPressEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
