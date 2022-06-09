"
A PangoFontMapTest is a test class for testing the behavior of PangoFontMap
"
Class {
	#name : #PangoFontMapTest,
	#superclass : #TestCase,
	#category : #'Pango-Tests-Base'
}

{ #category : #test }
PangoFontMapTest >> testListFamilies [

	self denyEmpty: PangoFontMap getDefault listFamilies
]

{ #category : #test }
PangoFontMapTest >> testNewPangoContext [

	self
		assert: PangoFontMap getDefault newPangoContext class
		equals: PangoContext
]
