"
This is a reference to be answered in `GListReferenceContainer>>#referenceTo:`. We cannot answer just one holder, as the caller needs to know more data (if the object was created, for instance).
"
Class {
	#name : 'GListReferenceMark',
	#superclass : 'Object',
	#instVars : [
		'object',
		'wasCreated'
	],
	#category : 'GLib-Lists',
	#package : 'GLib',
	#tag : 'Lists'
}

{ #category : 'instance creation' }
GListReferenceMark class >> newObject: aGObject created: aBoolean [

	^ self new
		object: aGObject;
		wasCreated: aBoolean;
		yourself
]

{ #category : 'accessing' }
GListReferenceMark >> object [

	^ object
]

{ #category : 'accessing' }
GListReferenceMark >> object: aGObject [

	object := aGObject
]

{ #category : 'accessing' }
GListReferenceMark >> wasCreated [

	^ wasCreated
]

{ #category : 'accessing' }
GListReferenceMark >> wasCreated: aBoolean [

	wasCreated := aBoolean
]
