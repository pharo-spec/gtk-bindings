"
https://docs.gtk.org/gtk4/signal.DrawingArea.resize.html
"
Class {
	#name : 'GResizeCallback',
	#superclass : 'GManagedSignalCallback',
	#pools : [
		'GObjectTypes'
	],
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'accessing' }
GResizeCallback class >> signalName [

	^ 'draw'
]

{ #category : 'accessing' }
GResizeCallback >> do: aBlock [

	^ super do: [ :widget :width :height :user_data |
		aBlock value: width@height ]
]

{ #category : 'accessing' }
GResizeCallback >> signature [

	^ #(void (void *widget, gint width, gint height, gpointer user_data))
]
