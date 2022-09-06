"
Simplified version of GtkTreeView to display lists
GtkTreeView — A widget for displaying both trees and lists

https://developer.gnome.org/gtk3/stable/GtkTreeView.html
"
Class {
	#name : #GtkTreeView,
	#superclass : #GtkContainer,
	#traits : 'GtkTScrollable',
	#classTraits : 'GtkTScrollable classTrait',
	#instVars : [
		'listStore',
		'selection',
		'columns',
		'searchFunction'
	],
	#pools : [
		'GdkDragAction',
		'GdkModifierType',
		'GtkTargetFlags'
	],
	#category : #'Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeView class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_tree_view_get_type())
]

{ #category : #'instance creation' }
GtkTreeView class >> new [

	^ self treeViewNew initialize
]

{ #category : #private }
GtkTreeView class >> treeViewNew [

	^ self ffiCall: #(#GtkTreeView *gtk_tree_view_new (void))
]

{ #category : #accessing }
GtkTreeView >> activateOnSingleClick: single [

	self ffiCall: #(void gtk_tree_view_set_activate_on_single_click (self, gboolean single))
]

{ #category : #simulating }
GtkTreeView >> activateRow: path column: column [ 

	self ffiCall: #(void gtk_tree_view_row_activated(self, GtkTreePath *path, GtkTreeViewColumn *column))

]

{ #category : #private }
GtkTreeView >> addExpanderColumn [

	self ffiCall: #(void gtk_tree_view_set_expander_column(self, 0))
]

{ #category : #accessing }
GtkTreeView >> allSelected [ 

	^ self selection allSelected 
]

{ #category : #columns }
GtkTreeView >> appendColumn: column [
	
	columns add: column.
	self basicAppendColumn: column.
	column addedToTreeView: self
]

{ #category : #'convenience columns' }
GtkTreeView >> appendPixbufColumn: columnIndex [
	| renderer |

	renderer := GtkCellRendererPixbuf new.
	self appendColumn: (GtkTreeViewColumn new
		packStart: renderer expand: false;
		addAttribute: 'pixbuf' 
			column: columnIndex 
			renderer: renderer)
]

{ #category : #'convenience columns' }
GtkTreeView >> appendTextColumn [

	self appendTextColumn: 0
]

{ #category : #'convenience columns' }
GtkTreeView >> appendTextColumn: columnIndex [
	| renderer |

	renderer := GtkCellRendererText new.
	self appendColumn: (GtkTreeViewColumn new
		packStart: renderer;
		addAttribute: 'text' column: columnIndex renderer: renderer)
]

{ #category : #accessing }
GtkTreeView >> autosize [

	self ffiCall: #(void gtk_tree_view_columns_autosize (self))
]

{ #category : #private }
GtkTreeView >> basicAppendColumn: column [

	self ffiCall: #(gint gtk_tree_view_append_column (self, GtkTreeViewColumn *column))
]

{ #category : #private }
GtkTreeView >> basicRemoveColumn: column [ 
	
	self ffiCall: #(gint gtk_tree_view_remove_column (self, GtkTreeViewColumn *column))
]

{ #category : #configuring }
GtkTreeView >> beMultipleSelectionMode [
	self selection mode: GtkSelectionMode GTK_SELECTION_MULTIPLE
]

{ #category : #configuring }
GtkTreeView >> beSingleSelectionMode [
	self selection mode: GtkSelectionMode GTK_SELECTION_SINGLE
]

{ #category : #private }
GtkTreeView >> cleanupAfterReplacing [

	self model roots: #() .
	self disconnect: #destroy.
		
	listStore prepareToDisconnect.
	listStore := nil.
]

{ #category : #expanding }
GtkTreeView >> collapseAll [

	self ffiCall: #(void gtk_tree_view_collapse_all (self))
]

{ #category : #expanding }
GtkTreeView >> collapseToPath: pathArray [

	self doCollapseRow: (GtkTreePath newFromArray: pathArray) autoRelease 
]

{ #category : #columns }
GtkTreeView >> columnAt: index [
	
	^ columns at: index
]

{ #category : #columns }
GtkTreeView >> columns [
	^ columns
]

{ #category : #signals }
GtkTreeView >> connectRowActivated: aBlock [ 
	
	^ (GRowActivatedCallback do: aBlock) connectTo: self
]

{ #category : #signals }
GtkTreeView >> connectRowExpanded: aBlock [

	self 
		connect: 'row-expanded' 
		signature: #(void (void *treeView, void *iter, void *path, void *userData))
		do: [ :treeView :iterHandle :pathHandle :userData | | iter path |
			iter := (GtkTreeIter fromHandle: iterHandle) copyInMemory.
			path := (GtkTreePath fromHandle: pathHandle) toArray.
			aBlock cull: iter cull: path  ]
]

{ #category : #signals }
GtkTreeView >> connectSelectionChanged: aBlock [

	^ self selection connectChanged: aBlock
]

{ #category : #signals }
GtkTreeView >> connectTestExpandRow: aBlock [
	"You need to answer false to allow expansion (yes, this is weird)"

	self 
		connect: 'test-expand-row' 
		signature: #(gboolean (void *treeView, void *iter, void *path, void *userData))
		do: [ :treeView :iterHandle :pathHandle :userData | | iter path |
			iter := (GtkTreeIter fromHandle: iterHandle) copyInMemory.
			path := (GtkTreePath fromHandle: pathHandle) toArray.
			aBlock cull: iter cull: path ]
]

{ #category : #private }
GtkTreeView >> doCollapseRow: path [ 
	
	self ffiCall: #(gboolean gtk_tree_view_collapse_row (self, GtkTreePath *path))
]

{ #category : #private }
GtkTreeView >> doExpandToPath: path [ 
	
	self ffiCall: #(void gtk_tree_view_expand_to_path (self, GtkTreePath *path))
]

{ #category : #'drag and drop' }
GtkTreeView >> enableModelDragDestDefault [ 
	"A convenience method that will enable the 'default way' of receive drops"

	self enableModelDragDestDefaultTarget: 'GTK_TREE_MODEL_ROW'
]

{ #category : #'drag and drop' }
GtkTreeView >> enableModelDragDestDefaultTarget: aString [
	"A convenience method that will enable the 'default way' of receive drops"
	| target |

	target := GtkTargetEntry 
		newTarget: aString 
		flags: GTK_TARGET_SAME_APP value
		info: 0.
	[
		self 
			enableModelDragDestTargets: target 
			numTargets: 1 
			actions: GDK_ACTION_MOVE | GDK_ACTION_COPY ]
	ensure: [ target free ]
]

{ #category : #private }
GtkTreeView >> enableModelDragDestTargets: targets numTargets: n_targets actions: actions [

	self ffiCall: #(void gtk_tree_view_enable_model_drag_dest (
		self,
		"const GtkTargetEntry *"void *targets,
		gint n_targets,
		GdkDragAction actions))
]

{ #category : #'drag and drop' }
GtkTreeView >> enableModelDragSourceDefault [
	"A convenience method that will enable the 'default way' of allowing drags"

	self enableModelDragSourceDefaultTarget: 'GTK_TREE_MODEL_ROW'
]

{ #category : #'drag and drop' }
GtkTreeView >> enableModelDragSourceDefaultTarget: aString [
	"A convenience method that will enable the 'default way' of allowing drags"
	| target |

	target := GtkTargetEntry 
		newTarget: aString
		flags: GTK_TARGET_SAME_APP value
		info: 0.		
	[
		self 
			enableModelDragSourceMask: GDK_BUTTON1_MASK 
			targets: target getHandle 
			numTargets: 1
			actions: GDK_ACTION_MOVE | GDK_ACTION_COPY ]
	ensure: [ target free ].
	"ensure we clean the transfer when a drag&drop is end (to prevent leaks)"
	self connectDragEnd: [ :context :user_data | GtkDragAndDropTransfer reset ]
]

{ #category : #private }
GtkTreeView >> enableModelDragSourceMask: start_button_mask targets: targets numTargets: n_targets actions: actions [

	self ffiCall: #(void gtk_tree_view_enable_model_drag_source(
		self,
		GdkModifierType start_button_mask,
		"const GtkTargetEntry *"void *targets,
		gint n_targets,
		GdkDragAction actions))
]

{ #category : #accessing }
GtkTreeView >> enableSearch: enable_search [

	self ffiCall: #(void gtk_tree_view_set_enable_search (self, gboolean enable_search))
]

{ #category : #private }
GtkTreeView >> enableTreeLines [

	self enableTreeLines: true
]

{ #category : #private }
GtkTreeView >> enableTreeLines: enabled [

	self ffiCall: #(void gtk_tree_view_set_enable_tree_lines (self,
                                     gboolean enabled))
]

{ #category : #expanding }
GtkTreeView >> expandAll [

	self ffiCall: #(void gtk_tree_view_expand_all (self))
]

{ #category : #expanding }
GtkTreeView >> expandToPath: pathArray [

	self doExpandToPath: (GtkTreePath newFromArray: pathArray) autoRelease 
]

{ #category : #accessing }
GtkTreeView >> fixedHeightMode: enable [

	^ self ffiCall: #(void gtk_tree_view_set_fixed_height_mode (self, gboolean enable))
]

{ #category : #private }
GtkTreeView >> getModel [

	^ self ffiCall: #(GtkListStore *gtk_tree_view_get_model (self))
]

{ #category : #private }
GtkTreeView >> getPathAtPosX: x y: y path: path column: column cellX: cell_x cellY: cell_y [

	^ self ffiCall: #(gboolean gtk_tree_view_get_path_at_pos (
		self,
		gint x,
		gint y,
		"GtkTreePath **"void **path,
		"GtkTreeViewColumn **"void **column,
		"gint *"void *cell_x,
		"gint *"void *cell_y))
]

{ #category : #private }
GtkTreeView >> getSelection [ 

	^ self ffiCall: #(GtkTreeSelection *gtk_tree_view_get_selection (self))
]

{ #category : #accessing }
GtkTreeView >> headersClickable [

	self headersClickable: true
]

{ #category : #private }
GtkTreeView >> headersClickable: setting [

	self ffiCall: #(void gtk_tree_view_set_headers_clickable (self, gboolean setting))
]

{ #category : #accessing }
GtkTreeView >> headersVisible: aBoolean [

	self gObjectSet: 'headers-visible' toBoolean: aBoolean
]

{ #category : #accessing }
GtkTreeView >> hoverExpand: expand [

	self ffiCall: #(void gtk_tree_view_set_hover_expand (self, gboolean expand))
]

{ #category : #accessing }
GtkTreeView >> hoverSelection: hover [

	self ffiCall: #(void gtk_tree_view_set_hover_selection (self, gboolean hover))
]

{ #category : #initialization }
GtkTreeView >> initialize [

	super initialize.
	self fixedHeightMode: true.
	columns := OrderedCollection new: 1.
	self hExpand: true
]

{ #category : #testing }
GtkTreeView >> isActivateOnSingleClick [
	
	^ self ffiCall: #(gboolean gtk_tree_view_get_activate_on_single_click (self))
]

{ #category : #testing }
GtkTreeView >> isEnableSearch [

	^ self ffiCall: #(gboolean gtk_tree_view_get_enable_search (self))
]

{ #category : #testing }
GtkTreeView >> isFixedHeightMode [

	^ self ffiCall: #(gboolean gtk_tree_view_get_fixed_height_mode (self))
]

{ #category : #testing }
GtkTreeView >> isHeadersClickable [

	^ self ffiCall: #(gboolean gtk_tree_view_get_headers_clickable (self))
]

{ #category : #testing }
GtkTreeView >> isHeadersVisible [
	| buffer |
	
	buffer := ByteArray new: Smalltalk wordSize.
	buffer pinInMemory.
	self gObjectGet: 'headers-visible' into: buffer.
	^ buffer booleanAt: 1
]

{ #category : #testing }
GtkTreeView >> isHoverExpand [ 

	^ self ffiCall: #(gboolean gtk_tree_view_get_hover_expand (self))
]

{ #category : #testing }
GtkTreeView >> isHoverSelection [ 

	^ self ffiCall: #(gboolean gtk_tree_view_get_hover_selection (self))
]

{ #category : #selection }
GtkTreeView >> isMultipleSelection [ 
	
	^ self selection mode = GtkSelectionMode GTK_SELECTION_MULTIPLE
]

{ #category : #testing }
GtkTreeView >> isShowExpander [

	^ self ffiCall: #(gboolean gtk_tree_view_get_show_expanders (self))
]

{ #category : #accessing }
GtkTreeView >> model [

	^ listStore ifNil: [ 
		listStore := self getModel ]
]

{ #category : #accessing }
GtkTreeView >> model: aListStore [

	listStore ifNotNil: [ 
		listStore prepareToDisconnect ].
	listStore := aListStore.
	listStore owner: self.
	self setModel: aListStore
]

{ #category : #accessing }
GtkTreeView >> pathAtPosition: aPoint then: aBlock [
	"gets the path, the column and the cell pointed by aPoint  which is a mouse position"
	| result pathHandle columnHandle xBuffer yBuffer |
	
	pathHandle := ExternalAddress new.
	columnHandle := ExternalAddress new.
	xBuffer := FFIInt32 newBuffer.
	yBuffer := FFIInt32 newBuffer.
	result := self 
		getPathAtPosX: aPoint x 
		y: aPoint y
		path: pathHandle
		column: columnHandle
		cellX: xBuffer 
		cellY: yBuffer.

	result ifTrue: [ 
		aBlock 
			value: (GtkTreePath fromHandle: pathHandle)
			value: columnHandle
			value: ((xBuffer signedLongAt: 1) + 1)@((yBuffer signedLongAt: 1) + 1) ].
		
	^ result
]

{ #category : #columns }
GtkTreeView >> removeAllColumns [
	
	columns copy do: [ :aColumn | self removeColumn: aColumn ]
]

{ #category : #columns }
GtkTreeView >> removeColumn: aGtkTreeViewColumn [
	
	columns remove: aGtkTreeViewColumn.
	self basicRemoveColumn: aGtkTreeViewColumn
]

{ #category : #private }
GtkTreeView >> scrollToCellPath: path column: column useAlign: use_align rowAlign: row_align colAlign: col_align [

	self ffiCall: #(void gtk_tree_view_scroll_to_cell (
		self,
		GtkTreePath *path,
		GtkTreeViewColumn *column,
		gboolean use_align,
		gfloat row_align,
		gfloat col_align))
]

{ #category : #accessing }
GtkTreeView >> scrollToPath: path [
	"Possible values: 
	 	0.0 -> align on top. 
		0.1 -> align 25% of list position
		0.2 -> align 50% of list position (at the center)"	
	self 
		scrollToPath: (GtkTreePath newFromArray: path) autoRelease
		useAlign: true 
		rowAlign: 0.2
		colAlign: 0.0
]

{ #category : #private }
GtkTreeView >> scrollToPath: path useAlign: use_align rowAlign: row_align colAlign: col_align [

	self ffiCall: #(void gtk_tree_view_scroll_to_cell (
		self,
		GtkTreePath *path,
		NULL,
		gboolean use_align,
		gfloat row_align,
		gfloat col_align))
]

{ #category : #accessing }
GtkTreeView >> searchEntry [

	^ self ffiCall: #(GtkEntry *gtk_tree_view_get_search_entry (self))
]

{ #category : #accessing }
GtkTreeView >> searchFunction: aBlock [

	searchFunction := GtkTreeViewSearchEqualFunc do: aBlock.
	self setSearchEqualFunc: searchFunction
]

{ #category : #selection }
GtkTreeView >> selectIndex: anInteger [ 
	
	self selection selectPath: { anInteger }
]

{ #category : #accessing }
GtkTreeView >> selectPath: pathArray [ 

	self selection selectPath: pathArray
]

{ #category : #accessing }
GtkTreeView >> selected [

	^ self allSelected 
		ifNotEmpty: [ :selected | selected first ]
		ifEmpty: [ nil ]
]

{ #category : #selection }
GtkTreeView >> selectedIndexes [

	^ self selection allSelected flattened
]

{ #category : #private }
GtkTreeView >> selection [ 

	^ selection ifNil: [ selection := self getSelection ]
]

{ #category : #private }
GtkTreeView >> setExpanderColumn: aColumn [

	self ffiCall: #(void gtk_tree_view_set_expander_column(self, GtkTreeViewColumn *aColumn))
]

{ #category : #private }
GtkTreeView >> setModel: aListStore [

	^ self ffiCall: #(void gtk_tree_view_set_model (self, GtkTreeStore *aListStore))
]

{ #category : #private }
GtkTreeView >> setSearchEqualFunc: search_equal_func [

	self ffiCall: #(void gtk_tree_view_set_search_equal_func (
		self,
 		GCallback search_equal_func,
 		NULL,
 		NULL))
]

{ #category : #accessing }
GtkTreeView >> showExpander: enabled [

	self ffiCall: #(void gtk_tree_view_set_show_expanders (self, gboolean enabled))
]
