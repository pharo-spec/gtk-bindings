"
A PangoAttrList represents a list of attributes that apply to a section of text.

https://docs.gtk.org/Pango/struct.AttrList.html
"
Class {
	#name : #PangoAttrList,
	#superclass : #PangoObject,
	#category : #'Pango-Base'
}

{ #category : #finalization }
PangoAttrList class >> finalizeResourceData: handle [

	handle isNull ifTrue: [ ^ self ].
	self pango_attr_list_unref: handle.
	handle beNull
]

{ #category : #'instance creation' }
PangoAttrList class >> new [ 

	^ self pango_attr_list_new initialize
]

{ #category : #private }
PangoAttrList class >> pango_attr_list_new [

	^ self ffiCall: #(PangoAttrList *pango_attr_list_new ())
]

{ #category : #private }
PangoAttrList class >> pango_attr_list_unref: list [

	self ffiCall: #(void pango_attr_list_unref (void* list))
]

{ #category : #adding }
PangoAttrList >> add: attr [ 

	attr 
		start_index: 0; 
		end_index: 16rFFFF.
	self insert: attr.
]

{ #category : #accessing }
PangoAttrList >> getIterator [

	^ self ffiCall: #( PangoAttrIterator* pango_attr_list_get_iterator ( self ) )
]

{ #category : #initialization }
PangoAttrList >> initialize [

	super initialize.
	self autoRelease
]

{ #category : #accessing }
PangoAttrList >> insert: attr [

	self ffiCall: #(void pango_attr_list_insert ( self, PangoAttribute* attr))
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
