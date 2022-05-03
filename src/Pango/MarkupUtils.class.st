Class {
	#name : #MarkupUtils,
	#superclass : #PangoObject,
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#category : #'Pango-Examples'
}

{ #category : #parsing }
MarkupUtils class >> example1 [ 

	| results utf8 attrs |
	results := self textAndAttributeListFrom: '<span foreground="blue" size="x-large">Blue text</span> is <i>cool</i>!'.

	utf8 := results first.
	attrs := results second.
	
	1halt.
]

{ #category : #'as yet unclassified' }
MarkupUtils class >> parse: markup_text length: length accelMarker: accel_marker attrList: attr_list text: text accelChar: accel_char error: error [

	^ self 
		ffiCall: #(
			bool
			pango_parse_markup (
			  const char* markup_text,
			  int length,
			  uint8 accel_marker,
			  PangoAttrList** attr_list,
			  char** text,
			  uint8* accel_char,
			  GError* error
			))

]

{ #category : #parsing }
MarkupUtils class >> textAndAttributeListFrom: aString [

	| markup_text attr_list text error hadError |
	markup_text := ExternalAddress fromString: aString.
	attr_list := ExternalAddress newPointer.
	text := ExternalAddress newPointer.
	error := GError new.

	hadError := self
		parse: markup_text
		length: -1
		accelMarker: 0
		attrList: attr_list
		text: text
		accelChar: ExternalAddress null
		error: error.

	hadError ifTrue: [ GtkError signal: error messageString ].	

	^ {	text readStringUTF8.
		 	attr_list readStringUTF8 }
]
