Class {
	#name : 'PangoGlyphString',
	#superclass : 'GStructure',
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#classVars : [
		'OFFSET_GLYPHS',
		'OFFSET_LOG_CLUSTERS',
		'OFFSET_NUM_GLYPHS'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'instance creation' }
PangoGlyphString class >> externalNew [

	^ self glyphStringNew
		  autoRelease;
		  yourself
]

{ #category : 'field definition' }
PangoGlyphString class >> fieldsDesc [
	"self rebuildFieldAccessors"

"  PangoGlyphInfo* glyphs;"
	^ #(
  int num_glyphs;
  void* glyphs;
  int* log_clusters;
	)
]

{ #category : 'finalization' }
PangoGlyphString class >> finalizeResourceData: handle [

	handle isNull ifTrue: [ ^ self ].
	self glyphStringFree: handle.
	handle beNull
]

{ #category : 'finalization' }
PangoGlyphString class >> glyphStringFree: handle [

	self ffiCall: #( void pango_glyph_string_free ( void* handle ) )
]

{ #category : 'instance creation' }
PangoGlyphString class >> glyphStringNew [

	^ self ffiCall: #( PangoGlyphString *pango_glyph_string_new () )
]

{ #category : 'instance creation' }
PangoGlyphString class >> shape: aString analysis: aPangoAnalysis [

	| glyphString |
	glyphString := self externalNew.

	glyphString
		shape: aString
		length: aString size
		analysis: aPangoAnalysis.

	^ glyphString
]

{ #category : 'instance creation' }
PangoGlyphString class >> shapeFull: itemString paragraph: paragraphString analysis: aPangoAnalysis [

	| glyphString |
	glyphString := self externalNew.

	glyphString
		shapeFull: itemString
		length: itemString size
		paragraphText: paragraphString
		paragraphLength: paragraphString size
		analysis: aPangoAnalysis.

	^ glyphString
]

{ #category : 'instance creation' }
PangoGlyphString class >> shapeItem: aPangoItem paragraphText: paragraphText [

	| glyphString |
	glyphString := self externalNew.

	glyphString
		shapeItem: aPangoItem
		paragraphText: paragraphText
		paragraphLength: paragraphText size
		logAttrs: ExternalAddress null
		flags: PangoShapeFlags PANGO_SHAPE_NONE.

	^ glyphString
]

{ #category : 'measuring' }
PangoGlyphString >> extentsWithFont: aFont [
	"Answer an array with 'ink' and 'logical' rectangles. 
	See https://docs.gtk.org/Pango/method.GlyphString.extents.html"

	| inkRectangle logicalRectangle |
	inkRectangle := PangoRectangle externalNew.
	logicalRectangle := PangoRectangle externalNew.

	self
		extentsWithFont: aFont
		inkRectangle: inkRectangle
		logicalRectangle: logicalRectangle.

	^ {  inkRectangle.
		  logicalRectangle }
]

{ #category : 'measuring' }
PangoGlyphString >> extentsWithFont: aFont inkRectangle: inkRectangle logicalRectangle: logicalRectangle [

	self ffiCall: #(
		void
		pango_glyph_string_extents (
		  self,
		  PangoFont* aFont,
		  PangoRectangle* inkRectangle,
		  PangoRectangle* logicalRectangle ))
]

{ #category : 'accessing - structure variables' }
PangoGlyphString >> glyphs [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_GLYPHS) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
PangoGlyphString >> glyphs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_GLYPHS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
PangoGlyphString >> log_clusters [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_LOG_CLUSTERS) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
PangoGlyphString >> log_clusters: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LOG_CLUSTERS put: anObject getHandle.
]

{ #category : 'measuring' }
PangoGlyphString >> logicalRectangleWithFont: aFont [
	"Answer a Rectangle with the logical bounds.
	See https://docs.gtk.org/Pango/method.GlyphString.extents.html"

	| logicalRectangle |
	logicalRectangle := PangoRectangle externalNew.

	self
		extentsWithFont: aFont
		inkRectangle: ExternalAddress null
		logicalRectangle: logicalRectangle.

	^ logicalRectangle asRectangle
]

{ #category : 'accessing - structure variables' }
PangoGlyphString >> num_glyphs [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NUM_GLYPHS
]

{ #category : 'accessing - structure variables' }
PangoGlyphString >> num_glyphs: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NUM_GLYPHS put: anObject
]

{ #category : 'shaping' }
PangoGlyphString >> shape: text length: length analysis: analysis [
	"https://docs.gtk.org/Pango/func.shape.html"

	^ self ffiCall: #(
		void
		pango_shape (
		  const char* text,
		  int length,
		  const PangoAnalysis* analysis,
		  self ))
]

{ #category : 'shaping' }
PangoGlyphString >> shapeFull: itemText length: itemLength paragraphText: paragraphText paragraphLength: paragraphLength analysis: analysis [
	"https://docs.gtk.org/Pango/func.shape_full.html"

	^ self ffiCall: #(
		void
		pango_shape_full (
		  const char* itemText,
		  int itemLength,
		  const char* paragraphText,
		  int paragraphLength,
		  const PangoAnalysis* analysis,
		  self ))
]

{ #category : 'shaping' }
PangoGlyphString >> shapeItem: aPangoItem paragraphText: paragraphText paragraphLength: paragraphLength logAttrs: logAttrs flags: flags [
	"https://docs.gtk.org/Pango/func.shape_item.html"

	^ self ffiCall: #(
		void
		pango_shape_item (
		  PangoItem* aPangoItem,
		  const char* paragraphText,
		  int paragraphLength,
		  PangoLogAttr* logAttrs,
		  self,
		  PangoShapeFlags flags ))
]
