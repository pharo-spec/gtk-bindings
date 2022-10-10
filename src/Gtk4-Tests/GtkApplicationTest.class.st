Class {
	#name : #GtkApplicationTest,
	#superclass : #GtkBaseTest,
	#category : #'Gtk4-Tests'
}

{ #category : #tests }
GtkApplicationTest >> testRun [
	| app run |

	run := false.	
	app := self newApplication.
	app connectActivate: [
		run := true.
		self continue ]. 
	app run.
	
	self wait.
	self assert: run.
	"time to let the process die"
	100 milliSeconds wait.
	self deny: app isRunning
]
