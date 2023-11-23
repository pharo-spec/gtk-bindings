"
The PangoColor structure is used to represent a color in an uncalibrated RGB color-space.

https://people.gnome.org/~ebassi/docs/_build/Pango/1.0/struct.Color.html
"
Class {
	#name : 'PangoColor',
	#superclass : 'GStructure',
	#classVars : [
		'OFFSET_BLUE',
		'OFFSET_GREEN',
		'OFFSET_RED'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'field definition' }
PangoColor class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ #(
	guint16 red;
	guint16 green;
	guint16 blue;
	)
]

{ #category : 'accessing - structure variables' }
PangoColor >> blue [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_BLUE
]

{ #category : 'accessing - structure variables' }
PangoColor >> blue: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_BLUE put: anObject
]

{ #category : 'accessing - structure variables' }
PangoColor >> green [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_GREEN
]

{ #category : 'accessing - structure variables' }
PangoColor >> green: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_GREEN put: anObject
]

{ #category : 'accessing - structure variables' }
PangoColor >> red [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_RED
]

{ #category : 'accessing - structure variables' }
PangoColor >> red: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_RED put: anObject
]
