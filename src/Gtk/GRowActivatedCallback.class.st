"
https://docs.gtk.org/gtk4/signal.ListView.activate.html
"
Class {
	#name : 'GRowActivatedCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'accessing' }
GRowActivatedCallback class >> signalName [

	^ 'activate'
]

{ #category : 'accessing' }
GRowActivatedCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :position :user_data | aBlock value: position ]
]

{ #category : 'accessing' }
GRowActivatedCallback >> signature [

	^ #(void (void* widget, guint position, gpointer user_data))
]
