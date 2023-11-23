Class {
	#name : 'PangoGlyphItem',
	#superclass : 'GStructure',
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#classVars : [
		'OFFSET_END_X_OFFSET',
		'OFFSET_GLYPHS',
		'OFFSET_ITEM',
		'OFFSET_START_X_OFFSET',
		'OFFSET_Y_OFFSET'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'field definition' }
PangoGlyphItem class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ #(
	  PangoItem* item;
	  PangoGlyphString* glyphs;
	  int y_offset;
	  int start_x_offset;
	  int end_x_offset;
		)
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> end_x_offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_END_X_OFFSET
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> end_x_offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_END_X_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> glyphs [
	"This method was automatically generated"
	^PangoGlyphString fromHandle: (handle pointerAt: OFFSET_GLYPHS)
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> glyphs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_GLYPHS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> item [
	"This method was automatically generated"
	^PangoItem fromHandle: (handle pointerAt: OFFSET_ITEM)
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> item: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ITEM put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> start_x_offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_START_X_OFFSET
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> start_x_offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_START_X_OFFSET put: anObject
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> y_offset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y_OFFSET
]

{ #category : 'accessing - structure variables' }
PangoGlyphItem >> y_offset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y_OFFSET put: anObject
]
