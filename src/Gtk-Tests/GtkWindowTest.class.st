Class {
	#name : 'GtkWindowTest',
	#superclass : 'GtkBaseTest',
	#instVars : [
		'window'
	],
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'running' }
GtkWindowTest >> tearDown [

	window ifNotNil: [ window close ].
	super tearDown.
]

{ #category : 'tests' }
GtkWindowTest >> testChild [

	(window := GtkWindow new) 
		child: (GtkLabel newLabel: 'Test');
		present.

	self assert: window child label equals: 'Test'
]

{ #category : 'tests' }
GtkWindowTest >> testPresent [
	"more like an smoke test, but well"

	window := GtkWindow new.
	window present
]
