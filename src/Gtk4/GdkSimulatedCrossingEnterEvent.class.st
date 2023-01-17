"
Simulate a `GdkCrossingEnterEvent`
"
Class {
	#name : #GdkSimulatedCrossingEnterEvent,
	#superclass : #GdkSimulatedCrossingEvent,
	#category : #'Gtk4-Event-Simulated'
}

{ #category : #testing }
GdkSimulatedCrossingEnterEvent >> isEnter [

	^ true
]
