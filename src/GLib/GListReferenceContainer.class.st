"
Keep the ""reference objects"" (the marks transmited to Gtk) in a separated container. 
The main reason for this is that this objects need to be unreferenced (freed) separately from its corresponding `GListReferenceStore`, mainly because we don't know when we will control the release of the store in pharo side, and independently of that, the referenced object need to be referenced ALWAYS.
"
Class {
	#name : #GListReferenceContainer,
	#superclass : #Object,
	#instVars : [
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

	objects valuesDo: [ :each |
		each objectUnref.
		each getHandle beNull ]
]

{ #category : #initialization }
GListReferenceContainer >> initialize [

	super initialize.
	objects := IdentityDictionary new
]

{ #category : #accessing }
GListReferenceContainer >> referenceAt: position [
	| holder |
	
	holder := objects at: position ifAbsent: [ nil ].
	holder ifNotNil: [ ^ holder ].

	"do not autorelease"
	holder :=	 (GObject basicNew 
			setHandle: (GObject gObjectNew: GObject gType);
			yourself)
		dataAt: 'position' put: (ExternalAddress fromAddress: position);
		yourself.

	objects at: position put: holder.

	^ holder
]

{ #category : #initialization }
GListReferenceContainer >> reset [

	GRunLoop defer: [ self freeReferences ].
	objects removeAll
]
