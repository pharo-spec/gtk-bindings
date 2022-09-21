Class {
	#name : #GtkCellRendererLink,
	#superclass : #GtkCellRendererCustom,
	#instVars : [
		'text',
		'linkPrototype',
		'activateAction',
		'active',
		'minimalWidth',
		'xalign',
		'treeView',
		'column'
	],
	#pools : [
		'GParamFlags'
	],
	#category : #'Gtk-Widget-CellRenderers'
}

{ #category : #defaults }
GtkCellRendererLink class >> defaultMinimalWidth [

	^ 80
]

{ #category : #'class initialization' }
GtkCellRendererLink class >> gInitializeClass: aDefinition [

	super gInitializeClass: aDefinition.
	self gInitializeClassActivate: aDefinition.
	self gInitializeClassGetPreferredWidth: aDefinition.
	
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
GtkCellRendererLink class >> gInitializeClassGetPreferredWidth: aDefinition [

	aDefinition get_preferred_width: (GCallback 
		signature: #(void (
			"GtkCellRenderer      *"void *cell,
			"GtkWidget            *"void *widget,
			"gint                 *"void *minimum,
			"gint                 *"void *natural ))
		block: [ :cell :widget :width :natural |
			(self gInstance: cell) 
				getPreferredWidth: widget 
				minimum: width 
				natural: natural ])
]

{ #category : #'class initialization' }
GtkCellRendererLink class >> gInitializeClassInstallPropertiesOn: aDefinition [

	aDefinition
		installPropertyStringId: 1
		name: 'text' 
		default: nil
		flags: G_PARAM_READWRITE.

	aDefinition
		installPropertyFloatId: 2
		name: 'xalign' 
		minimum: 0.0
		maximum: 1.0
		default: 0.0
		flags: G_PARAM_READWRITE.
		
	aDefinition
		installPropertyBooleanId: 3
		name: 'active' 
		default: false
		flags: G_PARAM_READWRITE | G_PARAM_EXPLICIT_NOTIFY
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

{ #category : #initialization }
GtkCellRendererLink >> addedToTreeView: aTreeView column: aColumn [
	
	treeView := aTreeView.
	column := aColumn.
	aTreeView connectMotionNotify: [ :event | 
		self maybeSetCursor: event.
		false ]
]

{ #category : #private }
GtkCellRendererLink >> calculateXIn: cellRect layout: layout [
	
	self xalign < 0.5 ifTrue: [ ^ cellRect x + self padding x ].
	self xalign = 0.5 ifTrue: [ ^ (cellRect x + (cellRect width - self padding x - layout scaledSize x) // 2) ].
	self xalign > 0.5 ifTrue: [ ^ (cellRect x + cellRect width) - self padding x - layout scaledSize x ].
	
	self error: 'Should not arrive here'
]

{ #category : #'accessing - geometry' }
GtkCellRendererLink >> getPreferredWidth: widget minimum: minimumSize natural: naturalSize [
	| layout textWidth |
		
	layout := self linkPrototype createPangoLayout: text.	
	layout width: -1.
	textWidth := layout size x.
	
	minimumSize isNull ifFalse: [ 
		minimumSize 
			signedLongAt: 1 
			put: (textWidth > self minimalWidth
				ifTrue: [ self minimalWidth ] 
				ifFalse: [ textWidth ceiling ]) ].
	naturalSize isNull ifFalse: [ 
		naturalSize signedLongAt: 1 put: textWidth ceiling ]
]

{ #category : #'accessing - properties' }
GtkCellRendererLink >> getProperty: id inValue: gValue [

	id = 1 ifTrue: [ gValue setString: text ].
	id = 2 ifTrue: [ gValue setFloat: xalign ].
	id = 3 ifTrue: [ gValue setBoolean: active ]
]

{ #category : #'accessing - geometry' }
GtkCellRendererLink >> getSize: widget rectangle: rect xOffset: xOffset yOffset: yOffset width: width height: height [ 

	xOffset isNull ifFalse: [ xOffset signedLongAt: 1 put: 2 ].
	yOffset isNull ifFalse: [ yOffset signedLongAt: 1 put: 2 ].
	width isNull ifFalse: [ width signedLongAt: 1 put: 100 ].
	height isNull ifFalse: [ height signedLongAt: 1 put: 20 ].	
]

{ #category : #initialization }
GtkCellRendererLink >> initialize [

	super initialize. 
	self padding: 2@2.
	self mode: GTK_CELL_RENDERER_MODE_ACTIVATABLE.
	active := false.
	xalign := 0.0
]

{ #category : #'private - testing' }
GtkCellRendererLink >> isEventInCell: event [
		
	treeView 
		pathAtPosition: event position
		then: [ :path :columnHandle :cell | 
			^ columnHandle = column getHandle ]. 
	^ false
]

{ #category : #private }
GtkCellRendererLink >> linkPrototype [
	
	^ linkPrototype ifNil: [ 
		linkPrototype := (GtkLinkButton newWithUri: '')
			autoRelease;
			addClass: 'hover';
			addClass: 'cell-link';
			yourself ]
]

{ #category : #initialization }
GtkCellRendererLink >> maybeSetCursor: event [
	
	(self isEventInCell: event)
		ifTrue: [ treeView gdkWindow cursor: GdkCursor newHand ]
		ifFalse: [ treeView gdkWindow cursor: GdkCursor null ]
]

{ #category : #accessing }
GtkCellRendererLink >> minimalWidth [

	^ minimalWidth ifNil: [ self class defaultMinimalWidth ]
]

{ #category : #accessing }
GtkCellRendererLink >> minimalWidth: aNumber [

	minimalWidth := aNumber
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

	x := self calculateXIn: cellRect layout: layout.	
	y := cellRect y + self padding y.	

	layout width: -1.

	canvas := AthensCairoCanvas fromHandle: cr.
	canvas primSaveState.
	canvas pushClipRect: cellRect. 
	context renderLayout: layout cr: cr x: x y: y.
	canvas primRestoreState
]

{ #category : #'accessing - properties' }
GtkCellRendererLink >> setProperty: id toValue: gValue [

	id = 1 ifTrue: [ text := gValue getString ].
	id = 2 ifTrue: [ xalign := gValue getFloat ].
	id = 3 ifTrue: [ active := gValue getBoolean ]
]

{ #category : #private }
GtkCellRendererLink >> xalign [

	^ xalign
]
