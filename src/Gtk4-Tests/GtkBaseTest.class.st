Class {
	#name : #GtkBaseTest,
	#superclass : #TestCase,
	#category : #'Gtk4-Tests-Base'
}

{ #category : #testing }
GtkBaseTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkBaseTest ]
]

{ #category : #'instance creation' }
GtkBaseTest >> newApplication [

	^ GtkApplication newId: ('org.pharo.Gtk4TestCase-', UUID new asString36)
]

{ #category : #'instance creation' }
GtkBaseTest >> runApplicationWith: aBlock [
	| sem error |

	GEngine ensureRunning.
	error := nil.
	sem := Semaphore new.
	self newApplication
		connectActivate: [ 
			[ 
				aBlock 
				on: Exception 
				do: [ :e | error := e freeze ] ] 
			ensure: [ sem signal ] ];
		run.
	sem wait.
	error ifNotNil: [ error debug ]
]

{ #category : #running }
GtkBaseTest >> runCase [

	self runApplicationWith: [ super runCase ]
]
