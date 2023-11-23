Class {
	#name : 'PangoRectangle',
	#superclass : 'GStructure',
	#classVars : [
		'OFFSET_HEIGHT',
		'OFFSET_WIDTH',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'field definition' }
PangoRectangle class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ #(
	  int x;
	  int y;
	  int width;
	  int height;
		)
]

{ #category : 'converting' }
PangoRectangle >> asRectangle [

	^ self origin extent: self extent
]

{ #category : 'accessing' }
PangoRectangle >> extent [

	^ self width pangoUnscaled @ self height pangoUnscaled
]

{ #category : 'accessing - structure variables' }
PangoRectangle >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : 'accessing - structure variables' }
PangoRectangle >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : 'accessing' }
PangoRectangle >> origin [

	^ self x pangoUnscaled @ self y pangoUnscaled
]

{ #category : 'printing' }
PangoRectangle >> printOn: aStream [

	aStream
		nextPutAll: self className;
		nextPutAll: '(';
		print: self asRectangle;
		nextPutAll: ' handle: ';
		print: handle;
		nextPutAll: ')'
]

{ #category : 'accessing - structure variables' }
PangoRectangle >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : 'accessing - structure variables' }
PangoRectangle >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]

{ #category : 'accessing - structure variables' }
PangoRectangle >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
PangoRectangle >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
PangoRectangle >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
PangoRectangle >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
