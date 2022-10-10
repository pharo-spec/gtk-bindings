Class {
	#name : #GtkBaseWithWindowTest,
	#superclass : #GtkBaseTest,
	#instVars : [
		'window'
	],
	#category : #'Gtk4-Tests'
}

{ #category : #testing }
GtkBaseWithWindowTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkBaseWithWindowTest ]
]

{ #category : #private }
GtkBaseWithWindowTest >> closeWindow [

	self defer: [ 
		window ifNotNil: #close.
		window := nil ]
]

{ #category : #private }
GtkBaseWithWindowTest >> openWindow [

	self runApplicationWith: [ 
		window := Gtk4Window new.
		window present ]
]

{ #category : #initialization }
GtkBaseWithWindowTest >> setUp [

	super setUp.
	self openWindow
]

{ #category : #running }
GtkBaseWithWindowTest >> tearDown [

	self closeWindow.
	super tearDown
]

{ #category : #accessing }
GtkBaseWithWindowTest >> window [

	^ window
]
