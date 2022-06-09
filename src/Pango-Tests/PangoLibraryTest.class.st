"
A PangoLibraryTest is a test class for testing the behavior of PangoLibrary
"
Class {
	#name : #PangoLibraryTest,
	#superclass : #TestCase,
	#category : #'Pango-Tests-Base'
}

{ #category : #test }
PangoLibraryTest >> testVersionString [

	self assert:
		(PangoLibrary uniqueInstance versionString beginsWith: '1.')
]
