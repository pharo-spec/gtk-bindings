"
A support for the engine, that needs to be executed when starting the `GtkEngine`.
This is useful for initialization of packages that may or not be included (see children as example). 
"
Class {
	#name : #GtkEngineSupport,
	#superclass : #Object,
	#category : #'Gtk-Application'
}

{ #category : #accessing }
GtkEngineSupport class >> allAvailable [
	
	^ self allSubclasses 
		select: [ :each | each isAvailable ]
		thenCollect: [ :each | each new ]
]

{ #category : #testing }
GtkEngineSupport class >> isAvailable [

	^ false
]

{ #category : #accessing }
GtkEngineSupport >> start [

	^ self subclassResponsibility
]
