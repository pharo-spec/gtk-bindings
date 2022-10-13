Class {
	#name : #GActionActivateCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Widget-Menu'
}

{ #category : #signalling }
GActionActivateCallback class >> signalName [

	^ 'activate'
]

{ #category : #enumerating }
GActionActivateCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :parameter :user_data | aBlock value ]
]

{ #category : #accessing }
GActionActivateCallback >> signature [

	^ #(void (void *action, void *parameter, gpointer user_data))
]
