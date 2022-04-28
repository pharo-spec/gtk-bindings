"
https://docs.gtk.org/Pango/struct.Attribute.html
"
Class {
	#name : #PangoAttribute,
	#superclass : #GStructure,
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#classVars : [
		'OFFSET_END_INDEX',
		'OFFSET_KLASS',
		'OFFSET_START_INDEX'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Pango-Base'
}

{ #category : #private }
PangoAttribute class >> backgroundNewAlpha: alpha [

	^ self ffiCall: #(PangoAttribute *pango_attr_background_alpha_new ( guint16 alpha ))
]

{ #category : #private }
PangoAttribute class >> backgroundNewRed: red green: green blue: blue [

	^ self ffiCall: #(PangoAttribute *pango_attr_background_new (
  		guint16 red,
  		guint16 green,
  		guint16 blue))
]

{ #category : #'field definition' }
PangoAttribute class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
	"const PangoAttrClass*"void *klass;
 	guint start_index;
	guint end_index;	
	)
]

{ #category : #private }
PangoAttribute class >> fontDescription: desc [

	^ self ffiCall: #(PangoAttribute *pango_attr_font_desc_new (
  		const PangoFontDescription* desc ))
]

{ #category : #private }
PangoAttribute class >> foregroundNewAlpha: alpha [

	^ self ffiCall: #(PangoAttribute *pango_attr_foreground_new ( guint16 alpha))
]

{ #category : #private }
PangoAttribute class >> foregroundNewRed: red green: green blue: blue [

	^ self ffiCall: #(PangoAttribute *pango_attr_foreground_new (
  		guint16 red,
  		guint16 green,
  		guint16 blue))
]

{ #category : #'instance creation' }
PangoAttribute class >> newBackgroundAlpha: alpha [

	^ (self backgroundNewAlpha: alpha) initialize 
]

{ #category : #'instance creation' }
PangoAttribute class >> newBackgroundColor: pangoColor [

	^ (self 
		backgroundNewRed: pangoColor red 
		green: pangoColor green 
		blue: pangoColor blue)
		initialize 
]

{ #category : #'instance creation' }
PangoAttribute class >> newBackgroundR: red g: green b: blue [

	^ (self backgroundNewRed: red green: green blue: blue) initialize
]

{ #category : #'instance creation' }
PangoAttribute class >> newFontDescription: aPangoFontDescription [

	^ (self fontDescription: aPangoFontDescription) initialize
]

{ #category : #'instance creation' }
PangoAttribute class >> newForegroundAlpha: alpha [

	^ (self foregroundNewAlpha: alpha) initialize 
]

{ #category : #'instance creation' }
PangoAttribute class >> newForegroundColor: pangoColor [

	^ (self 
		foregroundNewRed: pangoColor red 
		green: pangoColor green 
		blue: pangoColor blue)
		initialize 
]

{ #category : #'instance creation' }
PangoAttribute class >> newForegroundR: red g: green b: blue [

	^ (self foregroundNewRed: red green: green blue: blue) initialize
]

{ #category : #'instance creation' }
PangoAttribute class >> newUnderline: weight [ 
	"no = 0, simple=1, double=2"
	
	^ (self underlineNew: weight) initialize
]

{ #category : #private }
PangoAttribute class >> underlineNew: underline [

	^ self ffiCall: #(PangoAttribute* pango_attr_underline_new ("PangoUnderline"int underline))
]

{ #category : #'accessing - structure variables' }
PangoAttribute >> end_index [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_END_INDEX
]

{ #category : #'accessing - structure variables' }
PangoAttribute >> end_index: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_END_INDEX put: anObject
]

{ #category : #'accessing - structure variables' }
PangoAttribute >> klass [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_KLASS) type: ExternalType void asPointerType
]

{ #category : #'accessing - structure variables' }
PangoAttribute >> klass: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_KLASS put: anObject getHandle.
]

{ #category : #'accessing - structure variables' }
PangoAttribute >> start_index [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_START_INDEX
]

{ #category : #'accessing - structure variables' }
PangoAttribute >> start_index: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_START_INDEX put: anObject
]
