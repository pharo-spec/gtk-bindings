Class {
	#name : #PangoAttrIterator,
	#superclass : #PangoObject,
	#traits : 'TPangoLibrary',
	#classTraits : 'TPangoLibrary classTrait',
	#category : #'Pango-Base'
}

{ #category : #finalization }
PangoAttrIterator >> destroy [
	
	self ffiCall: #( void pango_attr_iterator_destroy ( self ) )
]

{ #category : #finalization }
PangoAttrIterator >> finalize [

	handle isNull ifTrue: [ ^ self ].
	GRunLoop defer: [ 
		self destroy.
		handle beNull ]
]
