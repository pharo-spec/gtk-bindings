Class {
	#name : #Gtk4ApplicationTest,
	#superclass : #Gtk4BaseTest,
	#category : #'Gtk4-Tests'
}

{ #category : #tests }
Gtk4ApplicationTest >> testRun [
	| app sem run |

	sem := Semaphore new.
	run := false.	
	app := self newApplication.
	app connectActivate: [ 
		run := true.
		sem signal ]. 
	app run.
	
	sem wait.
	self assert: run.
	"time to let the process die"
	5 milliSeconds wait.
	self deny: app isRunning
]
