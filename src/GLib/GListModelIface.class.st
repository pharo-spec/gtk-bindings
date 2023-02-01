"
https://docs.gtk.org/gio/iface.ListModel.html
"
Class {
	#name : #GListModelIface,
	#superclass : #GInterface,
	#instVars : [
		'get_item',
		'get_item_type',
		'get_n_items',
		'get_object',
		'items_changed'
	],
	#classVars : [
		'OFFSET_GET_ITEM',
		'OFFSET_GET_ITEM_TYPE',
		'OFFSET_GET_N_ITEMS',
		'OFFSET_GET_OBJECT',
		'OFFSET_ITEMS_CHANGED'
	],
	#category : #'GLib-Lists'
}

{ #category : #'field definition' }
GListModelIface class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ super fieldsDesc, #(
	GCallback get_item_type;
	GCallback get_n_items;
	GCallback get_item;
	GCallback get_object;
	GCallback items_changed;
)
]

{ #category : #accessing }
GListModelIface class >> gType [ 
	"This method was automatically generated"

	^ self 
		ffiCall: #(gsize g_list_model_get_type())
		module: GtkLibrary
]

{ #category : #'accessing - structure variables' }
GListModelIface >> get_item [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ITEM) asInteger)
]

{ #category : #'accessing - structure variables' }
GListModelIface >> get_item: aCallback [
	"This method was automatically generated"
	
	get_item := aCallback.
	handle 
		pointerAt: OFFSET_GET_ITEM
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing - structure variables' }
GListModelIface >> get_item_type [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ITEM_TYPE) asInteger)
]

{ #category : #'accessing - structure variables' }
GListModelIface >> get_item_type: aCallback [
	"This method was automatically generated"

	get_item_type := aCallback.
	handle 
		pointerAt: OFFSET_GET_ITEM_TYPE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing - structure variables' }
GListModelIface >> get_n_items [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_N_ITEMS) asInteger)
]

{ #category : #'accessing - structure variables' }
GListModelIface >> get_n_items: aCallback [
	"This method was automatically generated"
	
	get_n_items := aCallback.
	handle 
		pointerAt: OFFSET_GET_N_ITEMS
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing - structure variables' }
GListModelIface >> get_object [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_OBJECT) asInteger)
]

{ #category : #'accessing - structure variables' }
GListModelIface >> get_object: aCallback [
	"This method was automatically generated"
	
	get_object := aCallback.
	handle 
		pointerAt: OFFSET_GET_OBJECT
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing - structure variables' }
GListModelIface >> items_changed [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ITEMS_CHANGED) asInteger)
]

{ #category : #'accessing - structure variables' }
GListModelIface >> items_changed: aCallback [
	"This method was automatically generated"
	
	items_changed := aCallback.
	handle 
		pointerAt: OFFSET_ITEMS_CHANGED
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
