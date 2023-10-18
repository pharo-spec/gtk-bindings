"
https://developer.gnome.org/gtk3/stable/gtk3-GtkTreeView-drag-and-drop.html#GtkTreeDragDestIface
"
Class {
	#name : 'GtkTreeDragDestIface',
	#superclass : 'GInterface',
	#instVars : [
		'drag_data_received',
		'row_drop_possible'
	],
	#classVars : [
		'OFFSET_DRAG_DATA_RECEIVED',
		'OFFSET_ROW_DROP_POSSIBLE'
	],
	#category : 'Gtk-Widget-Tree',
	#package : 'Gtk',
	#tag : 'Widget-Tree'
}

{ #category : 'field definition' }
GtkTreeDragDestIface class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ super fieldsDesc, #(
	GCallback drag_data_received;
	GCallback row_drop_possible;
)
]

{ #category : 'accessing' }
GtkTreeDragDestIface class >> gType [ 
	"This method was automatically generated"

	^ self 
		ffiCall: #(gsize gtk_tree_drag_dest_get_type())
		module: GtkLibrary
]

{ #category : 'accessing - structure variables' }
GtkTreeDragDestIface >> drag_data_received [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_DRAG_DATA_RECEIVED) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkTreeDragDestIface >> drag_data_received: aCallback [
	"This method was automatically generated"
	
	drag_data_received := aCallback.
	handle 
		pointerAt: OFFSET_DRAG_DATA_RECEIVED
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkTreeDragDestIface >> row_drop_possible [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ROW_DROP_POSSIBLE) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkTreeDragDestIface >> row_drop_possible: aCallback [
	"This method was automatically generated"
	
	row_drop_possible := aCallback.
	handle 
		pointerAt: OFFSET_ROW_DROP_POSSIBLE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
