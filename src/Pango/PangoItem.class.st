Class {
	#name : 'PangoItem',
	#superclass : 'GStructure',
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#classVars : [
		'OFFSET_ANALYSIS',
		'OFFSET_LENGTH',
		'OFFSET_NUM_CHARS',
		'OFFSET_OFFSET'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'field definition' }
PangoItem class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ #(
	  int offset;
	  int length;
	  int num_chars;
	  PangoAnalysis analysis;
		)
]

{ #category : 'accessing - structure variables' }
PangoItem >> analysis [
	"This method was automatically generated"
	^ PangoAnalysis fromHandle: (handle referenceStructAt: OFFSET_ANALYSIS length: PangoAnalysis byteSize)
]

{ #category : 'accessing - structure variables' }
PangoItem >> analysis: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_ANALYSIS put: anObject getHandle length: PangoAnalysis byteSize
]

{ #category : 'accessing - structure variables' }
PangoItem >> length [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LENGTH
]

{ #category : 'accessing - structure variables' }
PangoItem >> length: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LENGTH put: anObject
]

{ #category : 'accessing - structure variables' }
PangoItem >> num_chars [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_CHARS
]

{ #category : 'accessing - structure variables' }
PangoItem >> num_chars: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_CHARS put: anObject
]

{ #category : 'accessing - structure variables' }
PangoItem >> offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_OFFSET
]

{ #category : 'accessing - structure variables' }
PangoItem >> offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_OFFSET put: anObject
]
