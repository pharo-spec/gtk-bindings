Class {
	#name : 'PangoAnalysis',
	#superclass : 'GStructure',
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#classVars : [
		'OFFSET_EXTRA_ATTRS',
		'OFFSET_FLAGS',
		'OFFSET_FONT',
		'OFFSET_GRAVITY',
		'OFFSET_LANGUAGE',
		'OFFSET_LANG_ENGINE',
		'OFFSET_LEVEL',
		'OFFSET_SCRIPT',
		'OFFSET_SHAPE_ENGINE'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'field definition' }
PangoAnalysis class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ #(
	  gpointer shape_engine;
	  gpointer lang_engine;
	  PangoFont* font;
	  guint8 level;
	  guint8 gravity;
	  guint8 flags;
	  guint8 script;
	  PangoLanguage* language;
	  GSList* extra_attrs;
		)
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> extra_attrs [
	"This method was automatically generated"
	^GSList fromHandle: (handle pointerAt: OFFSET_EXTRA_ATTRS)
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> extra_attrs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_EXTRA_ATTRS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> flags [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_FLAGS
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> flags: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_FLAGS put: anObject
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> font [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FONT) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> font: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FONT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> gravity [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_GRAVITY
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> gravity: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_GRAVITY put: anObject
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> lang_engine [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_LANG_ENGINE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> lang_engine: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LANG_ENGINE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> language [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_LANGUAGE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> language: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LANGUAGE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> level [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_LEVEL
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> level: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_LEVEL put: anObject
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> script [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_SCRIPT
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> script: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_SCRIPT put: anObject
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> shape_engine [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SHAPE_ENGINE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
PangoAnalysis >> shape_engine: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SHAPE_ENGINE put: anObject getHandle.
]
