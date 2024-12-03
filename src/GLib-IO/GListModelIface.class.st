"
https://docs.gtk.org/gio/iface.ListModel.html
"
Class {
	#name : 'GListModelIface',
	#superclass : 'GInterface',
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
		'OFFSET_GET_N_ITEMS'
	],
	#category : 'GLib-IO-Lists',
	#package : 'GLib-IO',
	#tag : 'Lists'
}

{ #category : 'field definition' }
GListModelIface class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ super fieldsDesc, #(
	GCallback get_item_type;
	GCallback get_n_items;
	GCallback get_item;
)
]

{ #category : 'accessing' }
GListModelIface class >> gType [ 
	"This method was automatically generated"

	^ self 
		ffiCall: #(gsize g_list_model_get_type())
		module: GLibIOLibrary
]

{ #category : 'accessing - structure variables' }
GListModelIface >> get_item [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ITEM) asInteger)
]

{ #category : 'accessing - structure variables' }
GListModelIface >> get_item: aCallback [
	"This method was automatically generated"
	
	get_item := aCallback.
	handle 
		pointerAt: OFFSET_GET_ITEM
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GListModelIface >> get_item_type [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ITEM_TYPE) asInteger)
]

{ #category : 'accessing - structure variables' }
GListModelIface >> get_item_type: aCallback [
	"This method was automatically generated"
	
	get_item_type := aCallback.
	handle 
		pointerAt: OFFSET_GET_ITEM_TYPE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GListModelIface >> get_n_items [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_N_ITEMS) asInteger)
]

{ #category : 'accessing - structure variables' }
GListModelIface >> get_n_items: aCallback [
	"This method was automatically generated"
	
	get_n_items := aCallback.
	handle 
		pointerAt: OFFSET_GET_N_ITEMS
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
