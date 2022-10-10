Class {
	#name : #GSetupCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk4-List'
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
