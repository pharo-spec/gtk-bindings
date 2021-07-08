Class {
	#name : #FcObject,
	#superclass : #FFIOpaqueObject,
	#pools : [
		'FcTypes'
	],
	#category : #'Pango-FontConfig'
}

{ #category : #'library path' }
FcObject class >> ffiLibraryName [

	^ FcLibrary
]

{ #category : #'library path' }
FcObject >> ffiLibraryName [

	^ self class ffiLibraryName
]
