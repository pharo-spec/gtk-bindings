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

{ #category : #'external resource management' }
PangoObject >> autoRelease [

	self resourceManager addResource: self
]

{ #category : #initialization }
PangoObject >> initialize [
	
]

{ #category : #'external resource management' }
PangoObject >> resourceManager [
	
	^ GExternalResourceManager uniqueInstance
]
