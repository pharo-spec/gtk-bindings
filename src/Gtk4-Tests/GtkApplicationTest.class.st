Class {
	#name : #GtkApplicationTest,
	#superclass : #GtkBaseTest,
	#category : #'Gtk4-Tests'
}

{ #category : #tests }
GtkApplicationTest >> testRun [
	| app run |

	run := false.	
	self runApplicationWith: [ 
		run := true ]. 
	self assert: run
]
