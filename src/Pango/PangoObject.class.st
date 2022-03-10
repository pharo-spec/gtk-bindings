Class {
	#name : #PangoObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#pools : [
		'GtkTypes'
	],
	#category : #'Pango-Base'
}

{ #category : #'library path' }
PangoObject class >> ffiLibraryName [
	^ PangoLibrary
]

{ #category : #initialization }
PangoObject >> initialize [
	
]
