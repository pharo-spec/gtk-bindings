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
