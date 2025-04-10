"
https://docs.gtk.org/gtk4/struct.BitsetIter.html
"
Class {
	#name : 'GtkBitsetIter',
	#superclass : 'GStructure',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'bitset'
	],
	#classVars : [
		'OFFSET_PRIVATE_DATA1',
		'OFFSET_PRIVATE_DATA10',
		'OFFSET_PRIVATE_DATA2',
		'OFFSET_PRIVATE_DATA3',
		'OFFSET_PRIVATE_DATA4',
		'OFFSET_PRIVATE_DATA5',
		'OFFSET_PRIVATE_DATA6',
		'OFFSET_PRIVATE_DATA7',
		'OFFSET_PRIVATE_DATA8',
		'OFFSET_PRIVATE_DATA9'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'field definition' }
GtkBitsetIter class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
	gpointer private_data1;
	gpointer private_data2;
	gpointer private_data3;
	gpointer private_data4;
	gpointer private_data5;
	gpointer private_data6;
	gpointer private_data7;
	gpointer private_data8;
	gpointer private_data9;
	gpointer private_data10;
	)
]

{ #category : 'instance creation' }
GtkBitsetIter class >> on: aBitset [

	^ self new 
		bitset: aBitset;
		yourself
]

{ #category : 'initialization' }
GtkBitsetIter >> bitset: aBitset [

	bitset := aBitset
]

{ #category : 'enumerating' }
GtkBitsetIter >> collect: aBlock [

	^ Array streamContents: [ :stream |
		self do: [ :each | stream nextPut: (aBlock value: each) ] ]
]

{ #category : 'enumerating' }
GtkBitsetIter >> do: aBlock [
	| current |

	current := self first.
	[ current notNil ]
	whileTrue: [ 
		aBlock value: current.
		current := self next ]
]

{ #category : 'private - enumerating' }
GtkBitsetIter >> first [
	| buffer |
	
	buffer := FFIUInt32 newBuffer.
	^ (self getFirst: buffer)
		ifTrue: [ buffer uint32AtOffset: 0 ]
		ifFalse: [ nil ]
]

{ #category : 'private - primitives' }
GtkBitsetIter >> getFirst: value [ 

	^ self ffiCall: #(gboolean gtk_bitset_iter_init_first (
  self,
  GtkBitset *bitset,
  void *value))
]

{ #category : 'private - primitives' }
GtkBitsetIter >> getNext: value [ 

	^ self ffiCall: #(gboolean gtk_bitset_iter_next (
  self,
  void *value))
]

{ #category : 'private - enumerating' }
GtkBitsetIter >> next [
	| buffer |
	
	buffer := FFIUInt32 newBuffer.
	^ (self getNext: buffer)
		ifTrue: [ buffer uint32AtOffset: 0 ]
		ifFalse: [ nil ]
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data1 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA1) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data10 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA10) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data10: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA10 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data1: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA1 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data2 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA2) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data2: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA2 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data3 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA3) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data3: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA3 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data4 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA4) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data4: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA4 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data5 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA5) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data5: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA5 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data6 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA6) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data6: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA6 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data7 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA7) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data7: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA7 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data8 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA8) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data8: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA8 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data9 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIVATE_DATA9) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkBitsetIter >> private_data9: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIVATE_DATA9 put: anObject getHandle.
]
