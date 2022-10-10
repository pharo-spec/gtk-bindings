Class {
	#name : #GListStoreMarkObject,
	#superclass : #GBaseObject,
	#traits : 'GTClass',
	#classTraits : 'GTClass classTrait',
	#pools : [
		'GParamFlags'
	],
	#category : #'GLib-Lists'
}

{ #category : #'class initialization' }
GListStoreMarkObject class >> gDefine: gClass [

	gClass parent: GObject
]

{ #category : #'class initialization' }
GListStoreMarkObject class >> gInitializeClassInstallPropertiesOn: aDefinition [

	aDefinition 
		installPropertyIntId: 1
		name: 'position' 
		default: 0 
		flags:  G_PARAM_READWRITE
]

{ #category : #accessing }
GListStoreMarkObject class >> gType [

	^ self gClass type
]
