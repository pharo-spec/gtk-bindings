Class {
	#name : #Gtk4WindowTest,
	#superclass : #Gtk4BaseTest,
	#category : #'Gtk4-Tests'
}

{ #category : #tests }
Gtk4WindowTest >> testPresent [
	"more like an smoke test, but well"
	| window sem |
	
	sem := Semaphore new.
	self newApplication 
		connectActivate: [ 
			window := Gtk4Window new.
			window present.
			sem signal ];
		run.
		
	sem wait.
	GRunLoop defer: [ window close ]
]
