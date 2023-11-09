Class {
	#name : 'GStructure',
	#superclass : 'FFIExternalStructure',
	#pools : [
		'GObjectTypes'
	],
	#category : 'GObject-Base',
	#package : 'GObject',
	#tag : 'Base'
}

{ #category : 'external resource management' }
GStructure >> autoRelease [

	self isExternalAddress ifFalse: [ ^ self ].
	^ GEngine current resourceManager addResource: self
]

{ #category : 'copying' }
GStructure >> copyIntoImage [
	| size bytes |

	size := self class structureSize.
	bytes := ByteArray new: size.
	LibC memCopy: self getHandle to: bytes size: size.
	^ self copy setHandle: bytes
]

{ #category : 'external resource management' }
GStructure >> resourceData [

	^ self getHandle
]
