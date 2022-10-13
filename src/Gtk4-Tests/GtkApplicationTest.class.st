Class {
	#name : #GtkApplicationTest,
	#superclass : #TestCase,
	#category : #'Gtk4-Tests'
}

{ #category : #tests }
GtkApplicationTest >> testRun [
	| app run sem |

	GEngine ensureRunning.
	sem := Semaphore new.
	run := false.	
	(app := GtkApplication newId: 'org.pharo.Gtk4TestCase') 
		connectActivate: [ 
			run := true. 
			sem signal ];
		run.
	sem wait.

	self assert: run
]
