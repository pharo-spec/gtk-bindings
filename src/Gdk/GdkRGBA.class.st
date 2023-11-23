"
GdkRGBA is a convenient way to pass rgba colors around. It’s based on cairo’s way to deal with colors and mirrors its behavior. All values are in the range from 0.0 to 1.0 inclusive. So the color (0.0, 0.0, 0.0, 0.0) represents transparent black and (1.0, 1.0, 1.0, 1.0) is opaque white. Other values will be clamped to this range when drawing.

https://developer.gnome.org/gdk3/stable/gdk3-RGBA-Colors.html
"
Class {
	#name : 'GdkRGBA',
	#superclass : 'GStructure',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#classVars : [
		'OFFSET_ALPHA',
		'OFFSET_BLUE',
		'OFFSET_GREEN',
		'OFFSET_RED'
	],
	#pools : [
		'GObjectTypes'
	],
	#category : 'Gdk-Misc',
	#package : 'Gdk',
	#tag : 'Misc'
}

{ #category : 'field definition' }
GdkRGBA class >> fieldsDesc [
	"self rebuildFieldAccessors"
	^ #(
	gdouble red;
  	gdouble green;
  	gdouble blue;
  	gdouble alpha;
	)
]

{ #category : 'instance creation' }
GdkRGBA class >> fromHexString: aColorHex [
	"Returns a color instance from HEX (6 element elements)."
	| green red blue alpha hexString |
	
	hexString := aColorHex withoutPrefix: '#'.
	red := (Integer readFrom: (hexString first: 2) base: 16) / 255.0.
	green := (Integer readFrom: (hexString copyFrom: 3 to: 4) base: 16) / 255.0.
	blue := (Integer readFrom: (hexString copyFrom: 5 to: 6) base: 16) / 255.0.
	
	alpha := hexString size = 8 
		ifFalse: [ 1.0 ]
		ifTrue: [ (Integer readFrom: (hexString copyFrom: 7 to: 8) base: 16) / 255.0 ].
	
	^ self r: red g: green b: blue alpha: alpha
]

{ #category : 'accessing' }
GdkRGBA class >> gType [

	^ self ffiCall: #(gsize gdk_rgba_get_type ())
]

{ #category : 'instance creation' }
GdkRGBA class >> r: red g: green b: blue alpha: alpha [

	^ self new 
		red: red;
		green: green;
		blue: blue;
		alpha: alpha;
		yourself
]

{ #category : 'accessing structure variables' }
GdkRGBA >> alpha [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_ALPHA
]

{ #category : 'accessing structure variables' }
GdkRGBA >> alpha: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_ALPHA put: anObject
]

{ #category : 'converting' }
GdkRGBA >> asColor [

	^ Color 
		r: self red 
		g: self green 
		b: self blue 
		alpha: self alpha
]

{ #category : 'converting' }
GdkRGBA >> asGdkRGBA [

	^ self
]

{ #category : 'converting' }
GdkRGBA >> asString [ 
	^ self ffiCall: #( gchar *gdk_rgba_to_string ( self ) )
]

{ #category : 'accessing structure variables' }
GdkRGBA >> blue [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_BLUE
]

{ #category : 'accessing structure variables' }
GdkRGBA >> blue: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_BLUE put: anObject
]

{ #category : 'accessing structure variables' }
GdkRGBA >> green [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_GREEN
]

{ #category : 'accessing structure variables' }
GdkRGBA >> green: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_GREEN put: anObject
]

{ #category : 'accessing structure variables' }
GdkRGBA >> red [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_RED
]

{ #category : 'accessing structure variables' }
GdkRGBA >> red: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_RED put: anObject
]
