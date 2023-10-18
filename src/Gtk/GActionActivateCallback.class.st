"
Indicates that the action was just activated.

https://docs.gtk.org/gio/signal.SimpleAction.activate.html
"
Class {
	#name : 'GActionActivateCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'Gtk-Widget-Menu',
	#package : 'Gtk',
	#tag : 'Widget-Menu'
}

{ #category : 'signalling' }
GActionActivateCallback class >> signalName [

	^ 'activate'
]

{ #category : 'enumerating' }
GActionActivateCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :parameter :user_data | aBlock value ]
]

{ #category : 'accessing' }
GActionActivateCallback >> signature [

	^ #(void (void *action, void *parameter, gpointer user_data))
]
