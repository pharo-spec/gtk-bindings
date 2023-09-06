"
Keep the ""reference objects"" (the marks transmited to Gtk) in a separated container. 
The main reason for this is that this objects need to be unreferenced (freed) separately from its corresponding `GListReferenceStore`, mainly because we don't know when we will control the release of the store in pharo side, and independently of that, the referenced object need to be referenced ALWAYS.
"
Class {
	#name : #GListReferenceContainer,
	#superclass : #Object,
	#instVars : [
		'mutex',
		'objects'
	],
	#classVars : [
		'ReferenceRegistry'
	],
	#category : #'GLib-Lists'
}

{ #category : #'private - registry' }
GListReferenceContainer class >> referenceRegistry [

	^ ReferenceRegistry ifNil: [ ReferenceRegistry := FinalizationRegistry new ]
]

{ #category : #'external resource management' }
GListReferenceContainer >> autoRelease [

	self class referenceRegistry add: self
]

{ #category : #finalization }
GListReferenceContainer >> finalize [

	GRunLoop defer: [ self freeReferences ]
]

{ #category : #finalization }
GListReferenceContainer >> freeReferences [

	mutex critical: [
		objects keysAndValuesDo: [ :position :object | 
			object objectUnref ] ]
]

{ #category : #initialization }
GListReferenceContainer >> initialize [

	super initialize.
	mutex := Mutex new.
	self resetObjects
]

{ #category : #'private - factory' }
GListReferenceContainer >> newHolderForPosition: position [
	
	^ GObject basicNew 
		setHandle: (GObject gObjectNew: GObject gType);
		installDebugSignals;
		dataAt: 'position' put: (ExternalAddress fromAddress: position);
		yourself
]

{ #category : #accessing }
GListReferenceContainer >> referenceAt: position [

	^ mutex critical: [ 	
		self safeReferenceAt: position ]
]

{ #category : #initialization }
GListReferenceContainer >> reset [

	GRunLoop defer: [ 
		self freeReferences.
		self resetObjects ]
]

{ #category : #initialization }
GListReferenceContainer >> resetObjects [

	mutex critical: [ 
		objects := IdentityDictionary new ]
]

{ #category : #accessing }
GListReferenceContainer >> safeReferenceAt: position [
	| holder created |
	
	created := false.
	holder := objects 
		at: position 
		ifAbsentPut: [ 
			created := true.
			self newHolderForPosition: position ].
	
	^ GListReferenceMark newObject: holder created: created
]
