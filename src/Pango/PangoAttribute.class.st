"
https://docs.gtk.org/Pango/struct.Attribute.html
"
Class {
	#name : 'PangoAttribute',
	#superclass : 'GStructure',
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#classVars : [
		'OFFSET_END_INDEX',
		'OFFSET_KLASS',
		'OFFSET_START_INDEX'
	],
	#pools : [
		'GObjectTypes'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'finalization' }
PangoAttribute class >> attributeDestroy: handle [

	self ffiCall: #( void pango_attribute_destroy ( void* handle ) )
]

{ #category : 'private' }
PangoAttribute class >> backgroundNewAlpha: alpha [

	^ self ffiCall: #(PangoAttribute *pango_attr_background_alpha_new ( guint16 alpha ))
]

{ #category : 'private' }
PangoAttribute class >> backgroundNewRed: red green: green blue: blue [

	^ self ffiCall: #(PangoAttribute *pango_attr_background_new (
  		guint16 red,
  		guint16 green,
  		guint16 blue))
]

{ #category : 'field definition' }
PangoAttribute class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
	"const PangoAttrClass*"void *klass;
 	guint start_index;
	guint end_index;	
	)
]

{ #category : 'finalization' }
PangoAttribute class >> finalizeResourceData: handle [

	handle isNull ifTrue: [ ^ self ].
	self attributeDestroy: handle.
	handle beNull
]

{ #category : 'private' }
PangoAttribute class >> fontDescription: desc [

	^ self ffiCall: #(PangoAttribute *pango_attr_font_desc_new (
  		const PangoFontDescription* desc ))
]

{ #category : 'private' }
PangoAttribute class >> foregroundNewAlpha: alpha [

	^ self ffiCall: #(PangoAttribute *pango_attr_foreground_new ( guint16 alpha))
]

{ #category : 'private' }
PangoAttribute class >> foregroundNewRed: red green: green blue: blue [

	^ self ffiCall: #(PangoAttribute *pango_attr_foreground_new (
  		guint16 red,
  		guint16 green,
  		guint16 blue))
]

{ #category : 'instance creation' }
PangoAttribute class >> newBackgroundAlpha: alpha [

	^ (self backgroundNewAlpha: alpha) initialize 
]

{ #category : 'instance creation' }
PangoAttribute class >> newBackgroundColor: pangoColor [

	^ (self 
		backgroundNewRed: pangoColor red * 65535
		green: pangoColor green * 65535
		blue: pangoColor blue * 65535)
		initialize 
]

{ #category : 'instance creation' }
PangoAttribute class >> newBackgroundR: red g: green b: blue [

	^ (self backgroundNewRed: red green: green blue: blue) initialize
]

{ #category : 'instance creation' }
PangoAttribute class >> newBold [

	^ self newWeight: 700
]

{ #category : 'instance creation' }
PangoAttribute class >> newFontDescription: aPangoFontDescription [

	^ (self fontDescription: aPangoFontDescription) initialize
]

{ #category : 'instance creation' }
PangoAttribute class >> newForegroundAlpha: alpha [

	^ (self foregroundNewAlpha: alpha) initialize 
]

{ #category : 'instance creation' }
PangoAttribute class >> newForegroundColor: pangoColor [

	^ (self 
		foregroundNewRed: pangoColor red * 65535
		green: pangoColor green * 65535
		blue: pangoColor blue * 65535)
		initialize 
]

{ #category : 'instance creation' }
PangoAttribute class >> newForegroundR: red g: green b: blue [

	^ (self foregroundNewRed: red green: green blue: blue) initialize
]

{ #category : 'instance creation' }
PangoAttribute class >> newItalic [

	^ self newStyle: 2
]

{ #category : 'instance creation' }
PangoAttribute class >> newStyle: style [
	"
PANGO_STYLE_NORMAL, The font is upright. 0
PANGO_STYLE_OBLIQUE, The font is slanted, but in a roman style. 1
PANGO_STYLE_ITALIC, The font is slanted in an italic style. 2
"

	^ (self styleNew: style) initialize
]

{ #category : 'instance creation' }
PangoAttribute class >> newUnderline [
	
	^ self newUnderline: 1
]

{ #category : 'instance creation' }
PangoAttribute class >> newUnderline: weight [ 
	"no = 0, simple=1, double=2"
	
	^ (self underlineNew: weight) initialize
]

{ #category : 'instance creation' }
PangoAttribute class >> newWeight: weight [
	"
PANGO_WEIGHT_THIN, The thin weight (= 100) Since: 1.24
PANGO_WEIGHT_ULTRALIGHT, The ultralight weight (= 200)
PANGO_WEIGHT_LIGHT, The light weight (= 300)
PANGO_WEIGHT_SEMILIGHT, The semilight weight (= 350) Since: 1.36.7
PANGO_WEIGHT_BOOK, The book weight (= 380) Since: 1.24)
PANGO_WEIGHT_NORMAL, The default weight (= 400)
PANGO_WEIGHT_MEDIUM, The normal weight (= 500) Since: 1.24
PANGO_WEIGHT_SEMIBOLD, The semibold weight (= 600)
PANGO_WEIGHT_BOLD, The bold weight (= 700)
PANGO_WEIGHT_ULTRABOLD, The ultrabold weight (= 800)
PANGO_WEIGHT_HEAVY, The heavy weight (= 900)
PANGO_WEIGHT_ULTRAHEAVY, The ultraheavy weight (= 1000) Since: 1.24"

	^ (self weightNew: weight) initialize
]

{ #category : 'private' }
PangoAttribute class >> styleNew: style [

	^ self ffiCall: #(PangoAttribute *pango_attr_style_new ("PangoStyle" uint style))
	
]

{ #category : 'private' }
PangoAttribute class >> underlineNew: underline [

	^ self ffiCall: #(PangoAttribute* pango_attr_underline_new ("PangoUnderline"int underline))
]

{ #category : 'private' }
PangoAttribute class >> weightNew: weight [

	^ self ffiCall: #(PangoAttribute *pango_attr_weight_new ("PangoWeight" uint weight))
	
]

{ #category : 'accessing - structure variables' }
PangoAttribute >> end_index [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_END_INDEX
]

{ #category : 'accessing - structure variables' }
PangoAttribute >> end_index: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_END_INDEX put: anObject
]

{ #category : 'initialization' }
PangoAttribute >> initialize [

	super initialize.
	
	self autoRelease.
]

{ #category : 'accessing - structure variables' }
PangoAttribute >> klass [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_KLASS) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
PangoAttribute >> klass: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_KLASS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
PangoAttribute >> start_index [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_START_INDEX
]

{ #category : 'accessing - structure variables' }
PangoAttribute >> start_index: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_START_INDEX put: anObject
]
