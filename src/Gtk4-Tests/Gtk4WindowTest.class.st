Class {
	#name : #Gtk4WindowTest,
	#superclass : #GtkBaseTest,
	#instVars : [
		'window'
	],
	#category : #'Gtk4-Tests'
}

{ #category : #running }
Gtk4WindowTest >> tearDown [

	window ifNotNil: [ 
		self defer: [ window close ] ].
	super tearDown.
]

{ #category : #tests }
Gtk4WindowTest >> testChild [

	self runApplicationWith: [ 
		(window := Gtk4Window new) 
			child: (GtkLabel newLabel: 'Test');
			present ].
		
	self assert: (self defer: [ window child label ]) equals: 'Test'
]

{ #category : #tests }
Gtk4WindowTest >> testPresent [
	"more like an smoke test, but well"

	self runApplicationWith: [ 			
		window := Gtk4Window new.
		window present ]
]
