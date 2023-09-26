Class {
	#name : #GtkListItemFactoryClass,
	#superclass : #GStructure,
	#traits : 'GtkTLibrary + GTClassStructure',
	#classTraits : 'GtkTLibrary classTrait + GTClassStructure classTrait',
	#instVars : [
		'parent_class',
		'setup',
		'teardown',
		'update'
	],
	#classVars : [
		'OFFSET_PARENT_CLASS',
		'OFFSET_SETUP',
		'OFFSET_TEARDOWN',
		'OFFSET_UPDATE'
	],
	#category : #'Gtk-Widget-ListView'
}

{ #category : #'field definition' }
GtkListItemFactoryClass class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
	GObjectClass parent_class;
	GCallback setup;
	GCallback teardown;
	GCallback update;
	)
	
]

{ #category : #'accessing - structure variables' }
GtkListItemFactoryClass >> parent_class [
	"This method was automatically generated"
	
	^ parent_class ifNil: [
		parent_class := GObjectClass fromHandle: (handle 
			referenceStructAt: OFFSET_PARENT_CLASS 
			length: GObjectClass byteSize) ]
]

{ #category : #'accessing - structure variables' }
GtkListItemFactoryClass >> parent_class: anObject [
	"This method was automatically generated"
	
	parent_class := anObject.
	handle 
		structAt: OFFSET_PARENT_CLASS 
		put: anObject getHandle 
		length: GObjectClass byteSize
]

{ #category : #'accessing - structure variables' }
GtkListItemFactoryClass >> setup [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_SETUP) asInteger)
]

{ #category : #'accessing - structure variables' }
GtkListItemFactoryClass >> setup: aCallback [
	"This method was automatically generated"

	setup := aCallback.	
	handle 
		pointerAt: OFFSET_SETUP
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing - structure variables' }
GtkListItemFactoryClass >> teardown [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_TEARDOWN) asInteger)
]

{ #category : #'accessing - structure variables' }
GtkListItemFactoryClass >> teardown: aCallback [
	"This method was automatically generated"

	teardown := aCallback.
	handle 
		pointerAt: OFFSET_TEARDOWN
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing - structure variables' }
GtkListItemFactoryClass >> update [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_UPDATE) asInteger)
]

{ #category : #'accessing - structure variables' }
GtkListItemFactoryClass >> update: aCallback [
	"This method was automatically generated"
	
	update := aCallback.
	handle 
		pointerAt: OFFSET_UPDATE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
