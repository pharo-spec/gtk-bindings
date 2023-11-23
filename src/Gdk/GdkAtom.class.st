Class {
	#name : 'GdkAtom',
	#superclass : 'FFIExternalObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#pools : [
		'GObjectTypes'
	],
	#category : 'Gdk-Misc',
	#package : 'Gdk',
	#tag : 'Misc'
}

{ #category : 'as yet unclassified' }
GdkAtom class >> internStaticString: atom_name [

	^ self ffiCall: #(GdkAtom gdk_atom_intern_static_string (const gchar *atom_name))
]

{ #category : 'comparing' }
GdkAtom >> = other [

	^ self species = other species
		and: [ self getHandle = other getHandle ]
]

{ #category : 'comparing' }
GdkAtom >> hash [

	^ self species hash bitXor: self getHandle hash
]

{ #category : 'accessing' }
GdkAtom >> name [

	^ self ffiCall: #(gchar *gdk_atom_name (self))
]
