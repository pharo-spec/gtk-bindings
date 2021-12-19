Class {
	#name : #GIOStatus,
	#superclass : #GEnumeration,
	#classVars : [
		'G_IO_STATUS_AGAIN',
		'G_IO_STATUS_EOF',
		'G_IO_STATUS_ERROR',
		'G_IO_STATUS_NORMAL'
	],
	#category : #'GLib-IO'
}

{ #category : #'accessing enum' }
GIOStatus class >> G_IO_STATUS_AGAIN [
	"This method was automatically generated"
	^ G_IO_STATUS_AGAIN
]

{ #category : #'accessing enum' }
GIOStatus class >> G_IO_STATUS_EOF [
	"This method was automatically generated"
	^ G_IO_STATUS_EOF
]

{ #category : #'accessing enum' }
GIOStatus class >> G_IO_STATUS_ERROR [
	"This method was automatically generated"
	^ G_IO_STATUS_ERROR
]

{ #category : #'accessing enum' }
GIOStatus class >> G_IO_STATUS_NORMAL [
	"This method was automatically generated"
	^ G_IO_STATUS_NORMAL
]

{ #category : #'enum declaration' }
GIOStatus class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors.
	"

	^ #(
G_IO_STATUS_ERROR 			0
G_IO_STATUS_NORMAL 		1
G_IO_STATUS_EOF 			2
G_IO_STATUS_AGAIN			3
	)
]
