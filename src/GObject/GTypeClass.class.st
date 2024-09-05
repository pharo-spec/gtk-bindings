"
This is taken from gtype.h:451

(in general, this is not a public structure and we use it just for debugging purposes)
"
Class {
	#name : 'GTypeClass',
	#superclass : 'GStructure',
	#classVars : [
		'OFFSET_G_TYPE'
	],
	#pools : [
		'GObjectTypes'
	],
	#category : 'GObject-Misc',
	#package : 'GObject',
	#tag : 'Misc'
}

{ #category : 'field definition' }
GTypeClass class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
	GType g_type;
	)
]

{ #category : 'accessing - structure variables' }
GTypeClass >> g_type [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_G_TYPE
]

{ #category : 'accessing - structure variables' }
GTypeClass >> g_type: anObject [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_G_TYPE put: anObject
]
