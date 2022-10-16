Class {
	#name : #GtkApplicationTest,
	#superclass : #TestCase,
	#category : #'Gtk4-Tests-Base'
}

{ #category : #tests }
GtkApplicationTest >> testRun [
	| app run sem |

	"this cannot work with the engine running"
	GEngine ensureRunning stop.
	
	sem := Semaphore new.
	run := false.	
	(app := GtkApplication 
		newId: 'org.pharo.Gtk4TestCase' 
		flags: GApplicationFlags G_APPLICATION_NON_UNIQUE) 
		connectActivate: [ 
			run := true. 
			sem signal ];
		run.
	sem wait.

	self assert: run
]
