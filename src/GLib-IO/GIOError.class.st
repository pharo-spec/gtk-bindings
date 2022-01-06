Class {
	#name : #GIOError,
	#superclass : #GEnumeration,
	#classVars : [
		'G_IO_ERROR_AGAIN',
		'G_IO_ERROR_INVAL',
		'G_IO_ERROR_NONE',
		'G_IO_ERROR_UNKNOWN'
	],
	#category : #'GLib-IO'
}

{ #category : #'accessing enum' }
GIOError class >> G_IO_ERROR_AGAIN [
	"This method was automatically generated"
	^ G_IO_ERROR_AGAIN
]

{ #category : #'accessing enum' }
GIOError class >> G_IO_ERROR_INVAL [
	"This method was automatically generated"
	^ G_IO_ERROR_INVAL
]

{ #category : #'accessing enum' }
GIOError class >> G_IO_ERROR_NONE [
	"This method was automatically generated"
	^ G_IO_ERROR_NONE
]

{ #category : #'accessing enum' }
GIOError class >> G_IO_ERROR_UNKNOWN [
	"This method was automatically generated"
	^ G_IO_ERROR_UNKNOWN
]

{ #category : #'enum declaration' }
GIOError class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors.
	"

	^ #(
  G_IO_ERROR_NONE 		0
  G_IO_ERROR_AGAIN 	1
  G_IO_ERROR_INVAL 	2
  G_IO_ERROR_UNKNOWN	3
	)
]
