Class {
	#name : #PangoShapeFlags,
	#superclass : #GEnumeration,
	#classVars : [
		'PANGO_SHAPE_NONE',
		'PANGO_SHAPE_ROUND_POSITIONS'
	],
	#category : #'Pango-Base'
}

{ #category : #'accessing enum' }
PangoShapeFlags class >> PANGO_SHAPE_NONE [
	"This method was automatically generated"
	^ PANGO_SHAPE_NONE
]

{ #category : #'accessing enum' }
PangoShapeFlags class >> PANGO_SHAPE_ROUND_POSITIONS [
	"This method was automatically generated"
	^ PANGO_SHAPE_ROUND_POSITIONS
]

{ #category : #'enum declaration' }
PangoShapeFlags class >> enumDecl [

	^ #(
		PANGO_SHAPE_NONE 					0
		PANGO_SHAPE_ROUND_POSITIONS 	1
		)
]
