"
https://docs.gtk.org/gtk4/signal.Notebook.switch-page.html
"
Class {
	#name : 'GtkSwitchPageCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'Gtk-Event-Callbacks',
	#package : 'Gtk',
	#tag : 'Event-Callbacks'
}

{ #category : 'signalling' }
GtkSwitchPageCallback class >> signalName [

	^ 'switch-page'
]

{ #category : 'enumerating' }
GtkSwitchPageCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :notebook :page :page_num :user_data | 
			aBlock value: page_num + 1 ]
]

{ #category : 'accessing' }
GtkSwitchPageCallback >> signature [

	^ #(void (void *notebook, void *page, guint page_num, gpointer user_data))
]
