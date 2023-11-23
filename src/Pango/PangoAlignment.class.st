Class {
	#name : 'PangoAlignment',
	#superclass : 'GEnumeration',
	#classVars : [
		'PANGO_ALIGN_CENTER',
		'PANGO_ALIGN_LEFT',
		'PANGO_ALIGN_RIGHT'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
PangoAlignment class >> PANGO_ALIGN_CENTER [
	"This method was automatically generated"
	^ PANGO_ALIGN_CENTER
]

{ #category : 'accessing enum' }
PangoAlignment class >> PANGO_ALIGN_LEFT [
	"This method was automatically generated"
	^ PANGO_ALIGN_LEFT
]

{ #category : 'accessing enum' }
PangoAlignment class >> PANGO_ALIGN_RIGHT [
	"This method was automatically generated"
	^ PANGO_ALIGN_RIGHT
]

{ #category : 'enum declaration' }
PangoAlignment class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"

	^ #(
	PANGO_ALIGN_LEFT 0
	PANGO_ALIGN_CENTER 1
	PANGO_ALIGN_RIGHT 2)
]
