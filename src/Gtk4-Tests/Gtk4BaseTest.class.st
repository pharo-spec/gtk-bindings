Class {
	#name : #Gtk4BaseTest,
	#superclass : #TestCase,
	#category : #'Gtk4-Tests'
}

{ #category : #testing }
Gtk4BaseTest class >> isAbstract [

	^ super isAbstract or: [ self = Gtk4BaseTest ]
]

{ #category : #'instance creation' }
Gtk4BaseTest >> newApplication [

	^ Gtk4Application newId: 'org.pharo.Gtk4TestingApp'
]

{ #category : #running }
Gtk4BaseTest >> runCase [

	GEngine ensureRunning.
	super runCase
]
