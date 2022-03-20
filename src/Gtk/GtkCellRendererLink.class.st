Class {
	#name : #GtkCellRendererLink,
	#superclass : #GtkCellRendererCustom,
	#instVars : [
		'text',
		'linkPrototype',
		'activateAction',
		'active'
	],
	#pools : [
		'GParamFlags'
	],
	#category : #'Gtk-Widget-CellRenderers'
}

{ #category : #'class initialization' }
GtkCellRendererLink class >> gInitializeClass: aDefinition [

	super gInitializeClass: aDefinition.
	self gInitializeClassActivate: aDefinition.
	
	aDefinition setAccessibleType: self gtkBooleanCellAccessibleGetType
]

{ #category : #'class initialization' }
GtkCellRendererLink class >> gInitializeClassActivate: aDefinition [

	aDefinition activate: (GCallback 
		signature: #(gboolean (
			"GtkCellRenderer      *"void *cell,
			"GdkEvent             *"void *event,
			"GtkWidget            *"void *widget,
			const gchar          *path,
			"const GdkRectangle   *"void *background_area,
			"const GdkRectangle   *"void *cell_area,
			"GtkCellRendererState" int flags))
		block: [ :cell :event : widget :path :bgArea :cellArea :flags |
			(self gInstance: cell) 
				activate: (GdkEvent fromHandle: event) 
				widget: (GtkWidget fromHandle: widget)
				path: path
				backgroundArea: (GdkRectangle fromHandle: bgArea)
				cellArea: (GdkRectangle fromHandle: cellArea)
				flags: flags ])	
]

{ #category : #'class initialization' }
GtkCellRendererLink class >> gInitializeClassInstallPropertiesOn: aDefinition [

	aDefinition
		installPropertyStringId: 1
		name: 'text' 
		default: nil
		flags: G_PARAM_READWRITE
]

{ #category : #activating }
GtkCellRendererLink >> activate: event widget: widget path: path backgroundArea: bgRect cellArea: cellRect flags: flags [

	activateAction ifNotNil: [ 
		activateAction 
			value: event 
			value: widget 
			value: path ].
	
	^ false
]

{ #category : #'accessing - properties' }
GtkCellRendererLink >> getProperty: id inValue: gValue [

	id = 1 ifTrue: [ gValue setString: text ].
	id = 2 ifTrue: [ gValue setBoolean: active ]
]

{ #category : #rendering }
GtkCellRendererLink >> getSize: widget rectangle: rect xOffset: xOffset yOffset: yOffset width: width height: height [ 

	
	xOffset ifNotNil: [ xOffset signedLongAt: 1 put: 2 ].
	yOffset ifNotNil: [ yOffset signedLongAt: 1 put: 2 ].
]

{ #category : #initialization }
GtkCellRendererLink >> initialize [

	super initialize. 
	self padding: 2@2.
	self mode: GTK_CELL_RENDERER_MODE_ACTIVATABLE.
	active := false
]

{ #category : #private }
GtkCellRendererLink >> linkPrototype [
	
	^ linkPrototype ifNil: [ 
		linkPrototype := ((GtkLinkButton newWithUri: '')
			addClass: 'hover';
			addClass: 'cell-link';
			yourself) ]
]

{ #category : #activating }
GtkCellRendererLink >> onActivate: aBlock [

	activateAction := aBlock
]

{ #category : #rendering }
GtkCellRendererLink >> renderCr: cr widget: widget backgroundArea: bgRect cellArea: cellRect flags: flags [
	| layout context x y canvas attrs |

	context := self linkPrototype styleContext.
	layout := self linkPrototype createPangoLayout: text.	
	attrs := PangoAttrList new.
	"for some reason, 'text-decoration-line' css property is not working, so I 
	 add the underline manually. "
	attrs add: (PangoAttribute newUnderline: 1).
	layout setAttributes: attrs.

	layout width: -1.
	
	x := cellRect x + self padding x.
	y := cellRect y + self padding y.
	
	canvas := AthensCairoCanvas fromHandle: cr.
	canvas primSaveState.
	context renderLayout: layout cr: cr x: x y: y.
	canvas primRestoreState
]

{ #category : #'accessing - properties' }
GtkCellRendererLink >> setProperty: id toValue: gValue [

	id = 1 ifTrue: [ text := gValue getString ].
	id = 2 ifTrue: [ active := gValue getBoolean ]
]
