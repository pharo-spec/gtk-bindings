"
Represents the structure of the GObject class.

https://developer-old.gnome.org/gobject/stable/gobject-The-Base-Object-Type.html#GObjectClass

This is useful when extending class and adding properties to it.

See `GtkCellRendererCustom` hierarchy as an example. 
"
Class {
	#name : 'GObjectClass',
	#superclass : 'GStructure',
	#traits : 'GObjectTLibrary + GTClassStructure',
	#classTraits : 'GObjectTLibrary classTrait + GTClassStructure classTrait',
	#instVars : [
		'constructed',
		'constructor',
		'dispatch_properties_changed',
		'dispose',
		'finalize',
		'get_property',
		'notify',
		'set_property'
	],
	#classVars : [
		'OFFSET_CONSTRUCTED',
		'OFFSET_CONSTRUCTOR',
		'OFFSET_CONSTRUCT_PROPERTIES',
		'OFFSET_DISPATCH_PROPERTIES_CHANGED',
		'OFFSET_DISPOSE',
		'OFFSET_FINALIZE',
		'OFFSET_FLAGS',
		'OFFSET_GET_PROPERTY',
		'OFFSET_G_TYPE_CLASS',
		'OFFSET_NOTIFY',
		'OFFSET_PDUMMY1',
		'OFFSET_PDUMMY2',
		'OFFSET_PDUMMY3',
		'OFFSET_PDUMMY4',
		'OFFSET_PDUMMY5',
		'OFFSET_PDUMMY6',
		'OFFSET_SET_PROPERTY'
	],
	#category : 'GObject-ClassBuilder',
	#package : 'GObject',
	#tag : 'ClassBuilder'
}

{ #category : 'field definition' }
GObjectClass class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
 	"GTypeClass"   GType g_type_class;

	GSList      *construct_properties;

 	GCallback 	constructor;
 	GCallback 	set_property;
  	GCallback 	get_property;
	GCallback 	dispose;
	GCallback 	finalize;
	GCallback 	dispatch_properties_changed;
  	GCallback 	notify;
	GCallback 	constructed;
	
	gsize			flags;

  	gpointer 	pdummy1;
  	gpointer 	pdummy2;
  	gpointer 	pdummy3;
  	gpointer 	pdummy4;
  	gpointer 	pdummy5;
  	gpointer 	pdummy6;
	
	)	


]

{ #category : 'accessing - structure variables' }
GObjectClass >> construct_properties [
	"This method was automatically generated"
	^GSList fromHandle: (handle pointerAt: OFFSET_CONSTRUCT_PROPERTIES)
]

{ #category : 'accessing - structure variables' }
GObjectClass >> construct_properties: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CONSTRUCT_PROPERTIES put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GObjectClass >> constructed [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_CONSTRUCTED) asInteger)
]

{ #category : 'accessing - structure variables' }
GObjectClass >> constructed: aCallback [
	"This method was automatically generated"
	
	constructed := aCallback.
	handle 
		pointerAt: OFFSET_CONSTRUCTED
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GObjectClass >> constructor [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_CONSTRUCTOR) asInteger)
]

{ #category : 'accessing - structure variables' }
GObjectClass >> constructor: aCallback [
	"This method was automatically generated"
	
	constructor := aCallback.
	handle 
		pointerAt: OFFSET_CONSTRUCTOR
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GObjectClass >> dispatch_properties_changed [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_DISPATCH_PROPERTIES_CHANGED) asInteger)
]

{ #category : 'accessing - structure variables' }
GObjectClass >> dispatch_properties_changed: aCallback [
	"This method was automatically generated"
	
	dispatch_properties_changed := aCallback.
	handle 
		pointerAt: OFFSET_DISPATCH_PROPERTIES_CHANGED
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GObjectClass >> dispose [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_DISPOSE) asInteger)
]

{ #category : 'accessing - structure variables' }
GObjectClass >> dispose: aCallback [
	"This method was automatically generated"
	
	dispose := aCallback.
	handle 
		pointerAt: OFFSET_DISPOSE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GObjectClass >> finalize [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_FINALIZE) asInteger)
]

{ #category : 'accessing - structure variables' }
GObjectClass >> finalize: aCallback [
	"This method was automatically generated"
	
	finalize := aCallback.
	handle 
		pointerAt: OFFSET_FINALIZE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GObjectClass >> flags [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_FLAGS
]

{ #category : 'accessing - structure variables' }
GObjectClass >> flags: anObject [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_FLAGS put: anObject
]

{ #category : 'accessing' }
GObjectClass >> gObjectClass [

	^ self
]

{ #category : 'accessing - structure variables' }
GObjectClass >> g_type_class [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_G_TYPE_CLASS
]

{ #category : 'accessing - structure variables' }
GObjectClass >> g_type_class: anObject [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_G_TYPE_CLASS put: anObject
]

{ #category : 'accessing - structure variables' }
GObjectClass >> get_property [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_PROPERTY) asInteger)
]

{ #category : 'accessing - structure variables' }
GObjectClass >> get_property: aCallback [
	"This method was automatically generated"
	
	get_property := aCallback.
	handle 
		pointerAt: OFFSET_GET_PROPERTY
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GObjectClass >> notify [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_NOTIFY) asInteger)
]

{ #category : 'accessing - structure variables' }
GObjectClass >> notify: aCallback [
	"This method was automatically generated"
	
	notify := aCallback.
	handle 
		pointerAt: OFFSET_NOTIFY
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy1 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PDUMMY1) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy1: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PDUMMY1 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy2 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PDUMMY2) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy2: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PDUMMY2 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy3 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PDUMMY3) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy3: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PDUMMY3 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy4 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PDUMMY4) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy4: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PDUMMY4 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy5 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PDUMMY5) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy5: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PDUMMY5 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy6 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PDUMMY6) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GObjectClass >> pdummy6: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PDUMMY6 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GObjectClass >> set_property [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_SET_PROPERTY) asInteger)
]

{ #category : 'accessing - structure variables' }
GObjectClass >> set_property: aCallback [
	"This method was automatically generated"
	
	set_property := aCallback.
	handle 
		pointerAt: OFFSET_SET_PROPERTY
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
