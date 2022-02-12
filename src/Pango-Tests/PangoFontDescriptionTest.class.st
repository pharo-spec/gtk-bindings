"
A PangoFontDescriptionTest is a test class for testing the behavior of PangoFontDescription
"
Class {
	#name : #PangoFontDescriptionTest,
	#superclass : #TestCase,
	#category : #'Pango-Tests-Base'
}

{ #category : #test }
PangoFontDescriptionTest >> testNewFromStringWithFamilyName [

	| aFontDescription |
	aFontDescription := PangoFontDescription newFromString: 'Arial Bold'.
	self assert: aFontDescription familyName equals: 'Arial'.

]

{ #category : #test }
PangoFontDescriptionTest >> testNewFromStringWithSizeInDeviceUnits [

	| aFontDescription |
	aFontDescription := PangoFontDescription newFromString: 'Arial Bold 10.75px'.
	self assert: aFontDescription hasSizeInDeviceUnits.
	self assert: aFontDescription sizeInPointsOrDeviceUnits equals: (10.75 * 1024) asInteger.

]

{ #category : #test }
PangoFontDescriptionTest >> testNewFromStringWithSizeInPoints [

	| aFontDescription |
	aFontDescription := PangoFontDescription newFromString: 'Arial Bold 24'.
	self deny: aFontDescription hasSizeInDeviceUnits.
	self assert: aFontDescription sizeInPointsOrDeviceUnits equals: 24 * 1024.
]
