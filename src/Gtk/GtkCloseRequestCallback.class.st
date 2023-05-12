"
Emitted when the user clicks on the close button of the window.

https://docs.gtk.org/gtk4/signal.Window.close-request.html
"
Class {
	#name : #GtkCloseRequestCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Event-Callbacks'
}

{ #category : #signalling }
GtkCloseRequestCallback class >> signalName [

	^ 'close-request'
]

{ #category : #enumerating }
GtkCloseRequestCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ : window :user_data | aBlock value ]
]

{ #category : #accessing }
GtkCloseRequestCallback >> signature [

	^ #(gboolean (void* window, gpointer user_data))
]
