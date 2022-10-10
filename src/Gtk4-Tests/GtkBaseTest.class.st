Class {
	#name : #GtkBaseTest,
	#superclass : #TestCase,
	#instVars : [
		'waitSemaphore',
		'application'
	],
	#category : #'Gtk4-Tests'
}

{ #category : #testing }
GtkBaseTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkBaseTest ]
]

{ #category : #private }
GtkBaseTest >> continue [

	waitSemaphore signal
]

{ #category : #private }
GtkBaseTest >> defer: aBlock [

	^ GRunLoop defer: aBlock
]

{ #category : #'instance creation' }
GtkBaseTest >> newApplication [

	^ GtkApplication newId: 'org.pharo.Gtk4TestingApp'
]

{ #category : #'instance creation' }
GtkBaseTest >> runApplicationWith: aBlock [

	(application := self newApplication) 
		connectActivate: [ 
			aBlock value.
			self continue ];
		run.
	self wait
]

{ #category : #running }
GtkBaseTest >> runCase [

	GEngine ensureRunning.
	super runCase
]

{ #category : #initialization }
GtkBaseTest >> setUp [

	super setUp.
	waitSemaphore := Semaphore new
]

{ #category : #running }
GtkBaseTest >> tearDown [

	application := nil.
	super tearDown
]

{ #category : #private }
GtkBaseTest >> wait [

	waitSemaphore wait
]
