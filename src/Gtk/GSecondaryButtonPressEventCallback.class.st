Class {
	#name : 'GSecondaryButtonPressEventCallback',
	#superclass : 'GButtonPressEventCallback',
	#pools : [
		'GtkTypes'
	],
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'accessing' }
GSecondaryButtonPressEventCallback >> do: aBlock [

	super do: [ :event |
		event isSecondaryButton
			ifTrue:[ aBlock cull: event ]
			ifFalse: [ false ] ]
]
