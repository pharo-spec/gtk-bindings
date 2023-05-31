"
https://docs.gtk.org/gtk4/signal.ListView.activate.html
"
Class {
	#name : #GListViewRowActivatedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Callbacks'
}

{ #category : #accessing }
GListViewRowActivatedCallback class >> signalName [

	^ 'activate'
]

{ #category : #accessing }
GListViewRowActivatedCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :position :user_data | aBlock value: position ]
]

{ #category : #accessing }
GListViewRowActivatedCallback >> signature [

	^ #(void (void* widget, guint position, gpointer user_data))
]
