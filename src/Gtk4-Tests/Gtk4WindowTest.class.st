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

	window ifNotNil: [ window close ].
	super tearDown.
]

{ #category : #tests }
Gtk4WindowTest >> testChild [

	(window := Gtk4Window new) 
		child: (GtkLabel newLabel: 'Test');
		present.

	self assert: window child label equals: 'Test'
]

{ #category : #tests }
Gtk4WindowTest >> testPresent [
	"more like an smoke test, but well"

	window := Gtk4Window new.
	window present
]
