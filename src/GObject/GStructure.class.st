Class {
	#name : #GStructure,
	#superclass : #FFIExternalStructure,
	#pools : [
		'GtkTypes'
	],
	#category : #'GObject-Base'
}

{ #category : #copying }
GStructure >> copyIntoImage [
	| size bytes |

	size := self class structureSize.
	bytes := ByteArray new: size.
	LibC memCopy: self getHandle to: bytes size: size.
	^ self copy setHandle: bytes
]
