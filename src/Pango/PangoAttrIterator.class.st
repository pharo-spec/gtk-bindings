Class {
	#name : #PangoAttrIterator,
	#superclass : #PangoObject,
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#category : #'Pango-Base'
}

{ #category : #finalization }
PangoAttrIterator class >> attrIteratorDestroy: handle [
	
	self ffiCall: #( void pango_attr_iterator_destroy ( void* handle ) )
]

{ #category : #finalization }
PangoAttrIterator class >> finalizeResourceData: handle [

	handle isNull ifTrue: [ ^ self ].
	self attrIteratorDestroy: handle.
	handle beNull
]
