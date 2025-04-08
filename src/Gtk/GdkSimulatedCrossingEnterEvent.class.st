"
Simulate a `GdkCrossingEnterEvent`
"
Class {
	#name : 'GdkSimulatedCrossingEnterEvent',
	#superclass : 'GdkSimulatedCrossingEvent',
	#category : 'Gtk-Events-Simulated',
	#package : 'Gtk',
	#tag : 'Events-Simulated'
}

{ #category : 'testing' }
GdkSimulatedCrossingEnterEvent >> isEnter [

	^ true
]
