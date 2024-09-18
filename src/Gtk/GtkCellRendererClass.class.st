"
https://developer-old.gnome.org/gtk3/unstable/GtkCellRenderer.html#GtkCellRendererClass
"
Class {
	#name : 'GtkCellRendererClass',
	#superclass : 'GStructure',
	#traits : 'GtkTLibrary + GTClassStructure',
	#classTraits : 'GtkTLibrary classTrait + GTClassStructure classTrait',
	#instVars : [
		'render',
		'activate',
		'editing_canceled',
		'editing_started',
		'get_aligned_area',
		'get_preferred_height',
		'get_preferred_height_for_width',
		'get_preferred_width',
		'get_preferred_width_for_height',
		'get_request_mode',
		'get_size',
		'start_editing',
		'parent_class'
	],
	#classVars : [
		'OFFSET_ACTIVATE',
		'OFFSET_EDITING_CANCELED',
		'OFFSET_EDITING_STARTED',
		'OFFSET_GET_ALIGNED_AREA',
		'OFFSET_GET_PREFERRED_HEIGHT',
		'OFFSET_GET_PREFERRED_HEIGHT_FOR_WIDTH',
		'OFFSET_GET_PREFERRED_WIDTH',
		'OFFSET_GET_PREFERRED_WIDTH_FOR_HEIGHT',
		'OFFSET_GET_REQUEST_MODE',
		'OFFSET_GET_SIZE',
		'OFFSET_PARENT_CLASS',
		'OFFSET_PRIV',
		'OFFSET_RENDER',
		'OFFSET_START_EDITING',
		'OFFSET__GTK_RESERVED2',
		'OFFSET__GTK_RESERVED3',
		'OFFSET__GTK_RESERVED4'
	],
	#category : 'Gtk-Widget-CellRenderers',
	#package : 'Gtk',
	#tag : 'Widget-CellRenderers'
}

{ #category : 'field definition' }
GtkCellRendererClass class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #(
	"GInitiallyUnownedClass "GObjectClass parent_class;
	GCallback get_request_mode;
	GCallback get_preferred_width;
	GCallback get_preferred_height_for_width;
	GCallback get_preferred_height;
	GCallback get_preferred_width_for_height;
	GCallback get_aligned_area;
	GCallback get_size;
	GCallback render;
	GCallback activate;
	GCallback start_editing;
	GCallback editing_canceled;
	GCallback editing_started;
	"GtkCellRendererClassPrivate *"void *priv;
	void *_gtk_reserved2;
	void *_gtk_reserved3;
	void *_gtk_reserved4;
	)
	
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> _gtk_reserved2 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET__GTK_RESERVED2) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> _gtk_reserved2: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET__GTK_RESERVED2 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> _gtk_reserved3 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET__GTK_RESERVED3) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> _gtk_reserved3: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET__GTK_RESERVED3 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> _gtk_reserved4 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET__GTK_RESERVED4) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> _gtk_reserved4: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET__GTK_RESERVED4 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> activate [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_ACTIVATE) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> activate: aCallback [
	"This method was automatically generated"
	
	activate := aCallback.
	handle 
		pointerAt: OFFSET_ACTIVATE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> editing_canceled [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_EDITING_CANCELED) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> editing_canceled: aCallback [
	"This method was automatically generated"
	
	editing_canceled := aCallback.
	handle 
		pointerAt: OFFSET_EDITING_CANCELED
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> editing_started [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_EDITING_STARTED) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> editing_started: aCallback [
	"This method was automatically generated"
	
	editing_started := aCallback.
	handle 
		pointerAt: OFFSET_EDITING_STARTED
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_aligned_area [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_ALIGNED_AREA) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_aligned_area: aCallback [
	"This method was automatically generated"
	
	get_aligned_area := aCallback.
	handle 
		pointerAt: OFFSET_GET_ALIGNED_AREA
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_preferred_height [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_PREFERRED_HEIGHT) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_preferred_height: aCallback [
	"This method was automatically generated"
	
	get_preferred_height := aCallback.
	handle 
		pointerAt: OFFSET_GET_PREFERRED_HEIGHT
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_preferred_height_for_width [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_PREFERRED_HEIGHT_FOR_WIDTH) asInteger)
]

{ #category : 'library path' }
GtkCellRendererClass >> get_preferred_height_for_width: aCallback [
	"This method was automatically generated"
	
	get_preferred_height_for_width := aCallback.
	handle 
		pointerAt: OFFSET_GET_PREFERRED_HEIGHT_FOR_WIDTH
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_preferred_width [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_PREFERRED_WIDTH) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_preferred_width: aCallback [
	"This method was automatically generated"
	
	get_preferred_width := aCallback.
	handle 
		pointerAt: OFFSET_GET_PREFERRED_WIDTH
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_preferred_width_for_height [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_PREFERRED_WIDTH_FOR_HEIGHT) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_preferred_width_for_height: aCallback [
	"This method was automatically generated"
	
	get_preferred_width_for_height := aCallback.
	handle 
		pointerAt: OFFSET_GET_PREFERRED_WIDTH_FOR_HEIGHT
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_request_mode [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_REQUEST_MODE) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_request_mode: aCallback [
	"This method was automatically generated"
	
	get_request_mode := aCallback.
	handle 
		pointerAt: OFFSET_GET_REQUEST_MODE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_size [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_GET_SIZE) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> get_size: aCallback [
	"This method was automatically generated"
	
	get_size := aCallback.
	handle 
		pointerAt: OFFSET_GET_SIZE
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> parent_class [
	"This method was automatically generated"
	
	^ parent_class ifNil: [
		parent_class := GObjectClass fromHandle: (handle 
			referenceStructAt: OFFSET_PARENT_CLASS 
			length: GObjectClass byteSize) ]
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> parent_class: anObject [
	"This method was automatically generated"
	
	parent_class := anObject.
	handle 
		structAt: OFFSET_PARENT_CLASS 
		put: anObject getHandle 
		length: GObjectClass byteSize
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> priv [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PRIV) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> priv: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PRIV put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> render [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_RENDER) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> render: aCallback [
	"This method was automatically generated"
	
	render := aCallback.
	handle 
		pointerAt: OFFSET_RENDER
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'initialization' }
GtkCellRendererClass >> setAccessibleType: type [ 

	self ffiCall: #(void gtk_cell_renderer_class_set_accessible_type ( self, "GType"gsize type ))
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> start_editing [
	"This method was automatically generated"
	^GCallback forAddress: ((handle pointerAt: OFFSET_START_EDITING) asInteger)
]

{ #category : 'accessing - structure variables' }
GtkCellRendererClass >> start_editing: aCallback [
	"This method was automatically generated"
	
	start_editing := aCallback.
	handle 
		pointerAt: OFFSET_START_EDITING
		put: (aCallback 
			ifNotNil: [ aCallback thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]
