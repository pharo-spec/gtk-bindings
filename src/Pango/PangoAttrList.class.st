"
A PangoAttrList represents a list of attributes that apply to a section of text.

https://docs.gtk.org/Pango/struct.AttrList.html
"
Class {
	#name : #PangoAttrList,
	#superclass : #PangoObject,
	#instVars : [
		'empty'
	],
	#category : #'Pango-Base'
}

{ #category : #'instance creation' }
PangoAttrList class >> new [ 

	^ self newUnowned autoRelease
]

{ #category : #'instance creation' }
PangoAttrList class >> newUnowned [

	^ self pango_attr_list_new initialize
]

{ #category : #private }
PangoAttrList class >> pango_attr_list_new [

	^ self ffiCall: #(PangoAttrList *pango_attr_list_new ())
]

{ #category : #accessing }
PangoAttrList >> add: attr [

	self add: attr from: 0 to: 16rFFFF
]

{ #category : #accessing }
PangoAttrList >> add: attr from: startIndex to: endIndex [

	attr
		start_index: startIndex;
		end_index: endIndex.
	self insert: attr.
	empty := false
]

{ #category : #finalization }
PangoAttrList >> finalize [

	handle isNull ifTrue: [ ^ self ].
	GRunLoop defer: [ 
		self unref.
		handle beNull ]
]

{ #category : #private }
PangoAttrList >> getIterator [

	^ self ffiCall: #( PangoAttrIterator* pango_attr_list_get_iterator ( self ) )
]

{ #category : #initialization }
PangoAttrList >> initialize [

	super initialize.
	empty := true
]

{ #category : #private }
PangoAttrList >> insert: attr [

	self ffiCall: #(void pango_attr_list_insert ( self, PangoAttribute* attr))
]

{ #category : #testing }
PangoAttrList >> isEmpty [

	^ empty
]

{ #category : #accessing }
PangoAttrList >> newIterator [

	^ self getIterator
		  autoRelease;
		  yourself
]

{ #category : #accessing }
PangoAttrList >> to_string [

	^ self ffiCall: #(
		char*
		pango_attr_list_to_string (
		  PangoAttrList* list ))
]

{ #category : #private }
PangoAttrList >> unref [

	self ffiCall: #(void pango_attr_list_unref (self))
]
