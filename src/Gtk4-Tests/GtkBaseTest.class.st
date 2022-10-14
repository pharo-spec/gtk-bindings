Class {
	#name : #GtkBaseTest,
	#superclass : #TestCase,
	#category : #'Gtk4-Tests-Base'
}

{ #category : #testing }
GtkBaseTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkBaseTest ]
]

{ #category : #running }
GtkBaseTest >> runCase [

	GEngine ensureRunning.
	GRunLoop defer: [ 
		super runCase ]
]
