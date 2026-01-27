"
https://docs.gtk.org/Pango/enum.Underline.html
"
Class {
	#name : 'PangoUnderline',
	#superclass : 'GEnumeration',
	#classVars : [
		'PANGO_UNDERLINE_DOUBLE',
		'PANGO_UNDERLINE_DOUBLE_LINE',
		'PANGO_UNDERLINE_ERROR',
		'PANGO_UNDERLINE_ERROR_LINE',
		'PANGO_UNDERLINE_LOW',
		'PANGO_UNDERLINE_NONE',
		'PANGO_UNDERLINE_SINGLE',
		'PANGO_UNDERLINE_SINGLE_LINE'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
PangoUnderline class >> PANGO_UNDERLINE_DOUBLE [
	"This method was automatically generated"
	^ PANGO_UNDERLINE_DOUBLE
]

{ #category : 'accessing enum' }
PangoUnderline class >> PANGO_UNDERLINE_DOUBLE_LINE [
	"This method was automatically generated"
	^ PANGO_UNDERLINE_DOUBLE_LINE
]

{ #category : 'accessing enum' }
PangoUnderline class >> PANGO_UNDERLINE_ERROR [
	"This method was automatically generated"
	^ PANGO_UNDERLINE_ERROR
]

{ #category : 'accessing enum' }
PangoUnderline class >> PANGO_UNDERLINE_ERROR_LINE [
	"This method was automatically generated"
	^ PANGO_UNDERLINE_ERROR_LINE
]

{ #category : 'accessing enum' }
PangoUnderline class >> PANGO_UNDERLINE_LOW [
	"This method was automatically generated"
	^ PANGO_UNDERLINE_LOW
]

{ #category : 'accessing enum' }
PangoUnderline class >> PANGO_UNDERLINE_NONE [
	"This method was automatically generated"
	^ PANGO_UNDERLINE_NONE
]

{ #category : 'accessing enum' }
PangoUnderline class >> PANGO_UNDERLINE_SINGLE [
	"This method was automatically generated"
	^ PANGO_UNDERLINE_SINGLE
]

{ #category : 'accessing enum' }
PangoUnderline class >> PANGO_UNDERLINE_SINGLE_LINE [
	"This method was automatically generated"
	^ PANGO_UNDERLINE_SINGLE_LINE
]

{ #category : 'enum declaration' }
PangoUnderline class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors
	"

	^ #(
	PANGO_UNDERLINE_NONE 		0
	PANGO_UNDERLINE_SINGLE 		1
	PANGO_UNDERLINE_DOUBLE 		2
	PANGO_UNDERLINE_LOW 			3
	PANGO_UNDERLINE_ERROR 		4
	PANGO_UNDERLINE_SINGLE_LINE 	5
	PANGO_UNDERLINE_DOUBLE_LINE 	6
	PANGO_UNDERLINE_ERROR_LINE 	7
	)
]
