Class {
	#name : #GIOCondition,
	#superclass : #GEnumeration,
	#classVars : [
		'G_IO_ERR',
		'G_IO_HUP',
		'G_IO_IN',
		'G_IO_NVAL',
		'G_IO_OUT',
		'G_IO_PRI'
	],
	#category : #'GLib-IO'
}

{ #category : #'accessing enum' }
GIOCondition class >> G_IO_ERR [
	"This method was automatically generated"
	^ G_IO_ERR
]

{ #category : #'accessing enum' }
GIOCondition class >> G_IO_HUP [
	"This method was automatically generated"
	^ G_IO_HUP
]

{ #category : #'accessing enum' }
GIOCondition class >> G_IO_IN [
	"This method was automatically generated"
	^ G_IO_IN
]

{ #category : #'accessing enum' }
GIOCondition class >> G_IO_NVAL [
	"This method was automatically generated"
	^ G_IO_NVAL
]

{ #category : #'accessing enum' }
GIOCondition class >> G_IO_OUT [
	"This method was automatically generated"
	^ G_IO_OUT
]

{ #category : #'accessing enum' }
GIOCondition class >> G_IO_PRI [
	"This method was automatically generated"
	^ G_IO_PRI
]

{ #category : #'enum declaration' }
GIOCondition class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors.
	"

	^ #(
G_IO_IN 		1
G_IO_OUT 		4
G_IO_PRI 		2
G_IO_ERR 		8
G_IO_HUP 		16
G_IO_NVAL 	32
	)
]
