"
https://ebassi.github.io/graphene/docs/graphene-Point.html#graphene-point-t
"
Class {
	#name : 'GraphenePoint',
	#superclass : 'GStructure',
	#classVars : [
		'OFFSET_X',
		'OFFSET_Y'
	],
	#pools : [
		'GObjectTypes'
	],
	#category : 'Gdk-Misc',
	#package : 'Gdk',
	#tag : 'Misc'
}

{ #category : 'field definition' }
GraphenePoint class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
	float x;
	float y;
	)
]

{ #category : 'converting' }
GraphenePoint >> asPoint [

	^ self x @ self y
]

{ #category : 'accessing - structure variables' }
GraphenePoint >> x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{ #category : 'accessing - structure variables' }
GraphenePoint >> x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{ #category : 'accessing - structure variables' }
GraphenePoint >> y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{ #category : 'accessing - structure variables' }
GraphenePoint >> y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]
