Class {
	#name : #GBindCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk4-Event-Callbacks'
}

{ #category : #signalling }
GBindCallback class >> signalName [

	^ 'bind'
]

{ #category : #enumerating }
GBindCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :factory :object :user_data | 
			aBlock value: (GtkListItem fromHandleUnreferenced: object) ]
]

{ #category : #accessing }
GBindCallback >> signature [

	^ #(void (void *factory, void *object, gpointer user_data))
]
