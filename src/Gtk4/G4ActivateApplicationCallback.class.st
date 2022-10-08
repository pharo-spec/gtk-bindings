Class {
	#name : #G4ActivateApplicationCallback,
	#superclass : #GManagedSignalCallback,
	#category : #Gtk4
}

{ #category : #signalling }
G4ActivateApplicationCallback class >> signalName [

	^ 'activate'
]

{ #category : #enumerating }
G4ActivateApplicationCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :app | aBlock value ]
]

{ #category : #accessing }
G4ActivateApplicationCallback >> signature [

	^ #(void (void *app))
]
