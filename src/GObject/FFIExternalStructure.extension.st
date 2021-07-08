Extension { #name : #FFIExternalStructure }

{ #category : #'*GObject' }
FFIExternalStructure >> copyInMemory [
	| bytes size |
	
	size := self class structureSize.
	bytes := ByteArray new: size.
	(LibC memCopy: self getHandle to: bytes size: size).
	^ self class fromHandle: bytes
]
