Class {
	#name : #GtkBaseTest,
	#superclass : #TestCase,
	#category : #'Gtk4-Tests'
}

{ #category : #testing }
GtkBaseTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkBaseTest ]
]

{ #category : #private }
GtkBaseTest >> defer: aBlock [

	^ GRunLoop defer: aBlock
]

{ #category : #'instance creation' }
GtkBaseTest >> newApplication [

	^ GtkApplication newId: ('org.pharo.Gtk4TestCase-', UUID new asString36)
]

{ #category : #'instance creation' }
GtkBaseTest >> runApplicationWith: aBlock [
	| sem |

	GEngine ensureRunning.
	sem := Semaphore new.
	self newApplication
		connectActivate: [ 
			aBlock 
			ensure: [ sem signal ] ];
		run.
	sem wait
]

{ #category : #running }
GtkBaseTest >> runCase [

	super runCase
]

{ #category : #initialization }
GtkBaseTest >> setUp [

	super setUp
]

{ #category : #running }
GtkBaseTest >> tearDown [

	super tearDown
]
