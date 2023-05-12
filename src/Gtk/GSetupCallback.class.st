"
e.g. https://docs.gtk.org/gtk4/signal.SignalListItemFactory.setup.html
"
Class {
	#name : #GSetupCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Event-Callbacks'
}

{ #category : #signalling }
GSetupCallback class >> signalName [

	^ 'setup'
]

{ #category : #enumerating }
GSetupCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :factory :object :user_data | 
			aBlock value: (GtkListItem fromHandleUnreferenced: object) ]
]

{ #category : #accessing }
GSetupCallback >> signature [

	^ #(void (void *factory, void *object, gpointer user_data))
]
