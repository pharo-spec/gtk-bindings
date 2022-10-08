Class {
	#name : #G4Application,
	#superclass : #GObject,
	#category : #Gtk4
}

{ #category : #signaling }
G4Application >> connectActivate: aBlock [

	(G4ActivateApplicationCallback do: aBlock) connectTo: self
]

{ #category : #'private - primitives' }
G4Application >> gRun [
	
	^ self ffiCall: #(int g_application_run (self, int 0, NULL))
]
