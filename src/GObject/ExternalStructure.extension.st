Extension { #name : #ExternalStructure }

{ #category : #'*GObject' }
ExternalStructure class >> fromPointerBuffer: aBuffer [

	^ self fromHandle: (aBuffer pointerAt: 1)
]
