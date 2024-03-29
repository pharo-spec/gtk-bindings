"
The GSList struct is used for each element in the singly-linked list.

https://developer.gnome.org/glib/unstable/glib-Singly-Linked-Lists.html#GSList
"
Class {
	#name : #GSList,
	#superclass : #GStructure,
	#traits : 'GLibTLibrary + GTEnumerable',
	#classTraits : 'GLibTLibrary classTrait + GTEnumerable classTrait',
	#classVars : [
		'OFFSET_DATA',
		'OFFSET_NEXT'
	],
	#category : #'GLib-Lists'
}

{ #category : #'library path' }
GSList class >> ffiLibrary [

	^ GLibLibrary
]

{ #category : #'field definition' }
GSList class >> fieldsDesc [ 
	"self rebuildFieldAccessors"
	^ #(
  gpointer data;
  GSList *next;
	)
]

{ #category : #finalization }
GSList class >> finalizeResourceData: handle [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	(self isValidHandle: handle) ifFalse: [ ^ self ].
	self gSlistFree: handle.
	handle beNull
]

{ #category : #private }
GSList class >> gSlistFree: listHandle [
	
	self ffiCall: #(void g_slist_free ("GSList"void *listHandle))
]

{ #category : #testing }
GSList class >> isValidHandle: handle [

	^ handle notNil and: [ handle isNull not ]
]

{ #category : #private }
GSList >> basicFree [

	self ffiCall: #(void g_slist_free (self))
]

{ #category : #'accessing structure variables' }
GSList >> data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA) type: ExternalType void asPointerType
]

{ #category : #enumerating }
GSList >> do: aBlock [

	self 
		traverseNext: self 
		do: aBlock
]

{ #category : #private }
GSList >> engine [

	^ GEngine current
]

{ #category : #'library path' }
GSList >> ffiLibrary [

	^ GLibLibrary
]

{ #category : #initialization }
GSList >> free [
	
	self basicFree.
	self getHandle beNull
]

{ #category : #initialization }
GSList >> initialize [
	
	super initialize.
	"self autoRelease"
]

{ #category : #'accessing structure variables' }
GSList >> next [
	| next |

	next := handle pointerAt: OFFSET_NEXT.
	^ next isNull
		ifTrue: [ nil ]
		ifFalse: [ GSList fromHandle: next ]
]

{ #category : #private }
GSList >> traverseNext: anElement do: aBlock [

	(anElement isNil or: [ anElement isNull ]) ifTrue: [ ^ self ].
	aBlock value: anElement data.
	self traverseNext: anElement next do: aBlock
]
