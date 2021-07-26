"
https://developer.gnome.org/gtk3/stable/gtk3-GtkTreeView-drag-and-drop.html#GtkTreeDragSourceIface
"
Class {
	#name : #GtkTreeDragSourceIface,
	#superclass : #GInterface,
	#instVars : [
		'drag_data_delete',
		'drag_data_get',
		'row_draggable'
	],
	#classVars : [
		'OFFSET_DRAG_DATA_DELETE',
		'OFFSET_DRAG_DATA_GET',
		'OFFSET_ROW_DRAGGABLE'
	],
	#category : #'Gtk-Widget-Tree'
}

{ #category : #'field definition' }
GtkTreeDragSourceIface class >> fieldsDesc [
	"self rebuildFieldAccessors"
	
	^ super fieldsDesc, #(
	GCallback row_draggable;
	GCallback drag_data_get;
	GCallback drag_data_delete;
)
]

{ #category : #accessing }
GtkTreeDragSourceIface class >> gType [ 
	"This method was automatically generated"

	^ self 
		ffiCall: #(gsize gtk_tree_drag_source_get_type())
		module: GtkLibrary
]

{ #category : #'accessing - structure variables' }
GtkTreeDragSourceIface >> drag_data_delete [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_DRAG_DATA_DELETE) asInteger)
]

{ #category : #'accessing - structure variables' }
GtkTreeDragSourceIface >> drag_data_delete: aCallback [
	"This method was automatically generated"
	
	drag_data_delete := aCallback.
	handle 
		pointerAt: OFFSET_DRAG_DATA_DELETE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing - structure variables' }
GtkTreeDragSourceIface >> drag_data_get [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_DRAG_DATA_GET) asInteger)
]

{ #category : #'accessing - structure variables' }
GtkTreeDragSourceIface >> drag_data_get: aCallback [
	"This method was automatically generated"
	
	drag_data_get := aCallback.
	handle 
		pointerAt: OFFSET_DRAG_DATA_GET
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing - structure variables' }
GtkTreeDragSourceIface >> row_draggable [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ROW_DRAGGABLE) asInteger)
]

{ #category : #'accessing - structure variables' }
GtkTreeDragSourceIface >> row_draggable: aCallback [
	"This method was automatically generated"
	
	row_draggable := aCallback.
	handle 
		pointerAt: OFFSET_ROW_DRAGGABLE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
