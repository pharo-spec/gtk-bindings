Class {
	#name : #GtkTestCase,
	#superclass : #TestCase,
	#category : #'Gtk-Tests'
}

{ #category : #testing }
GtkTestCase class >> isAbstract [ 

	^ self = GtkTestCase 
]

{ #category : #accessing }
GtkTestCase class >> resources [

	^ { GtkTestResource }
]
