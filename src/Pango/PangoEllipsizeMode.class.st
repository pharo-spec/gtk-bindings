Class {
	#name : 'PangoEllipsizeMode',
	#superclass : 'GEnumeration',
	#classVars : [
		'PANGO_ELLIPSIZE_END',
		'PANGO_ELLIPSIZE_MIDDLE',
		'PANGO_ELLIPSIZE_NONE',
		'PANGO_ELLIPSIZE_START'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
PangoEllipsizeMode class >> PANGO_ELLIPSIZE_END [
	"This method was automatically generated"
	^ PANGO_ELLIPSIZE_END
]

{ #category : 'accessing enum' }
PangoEllipsizeMode class >> PANGO_ELLIPSIZE_MIDDLE [
	"This method was automatically generated"
	^ PANGO_ELLIPSIZE_MIDDLE
]

{ #category : 'accessing enum' }
PangoEllipsizeMode class >> PANGO_ELLIPSIZE_NONE [
	"This method was automatically generated"
	^ PANGO_ELLIPSIZE_NONE
]

{ #category : 'accessing enum' }
PangoEllipsizeMode class >> PANGO_ELLIPSIZE_START [
	"This method was automatically generated"
	^ PANGO_ELLIPSIZE_START
]

{ #category : 'enum declaration' }
PangoEllipsizeMode class >> enumDecl [
	"self initializeEnumeration; rebuildEnumAccessors"

	^ #(
  PANGO_ELLIPSIZE_NONE   0
  PANGO_ELLIPSIZE_START  1
  PANGO_ELLIPSIZE_MIDDLE 2
  PANGO_ELLIPSIZE_END	 3)
]
