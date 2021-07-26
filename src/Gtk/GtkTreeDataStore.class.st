"
A data store is a special implementation of a tree store that will provide data directly from the image (otherwise, with a ==GtkTreeStore== you need to provide elements ''before'', which is time consuming and not very friendly to calculate properties).

Plesse, notice that the usage of a ==GtkTreeDataStore== is not magical and it will not solve all size/time to load problems, since ==GtkTreeView== fetches all elements in a leaf before showing it (meaning that if you have 10k elements in a list, it will take time to be filled).

!! A note about large lists

When using a data store with large amounts of data, it will still take some time to fill the list (I have test 1.7s with 10k items, which is probably not good).
Still, while maybe this is acceptable, it is still a problem the fact that when a GtkTreeView is destroyed it iterates all nodes created (maybe to give a change to users to free what they stored in user_data?), and it also makes a call to ==#iterNext:== for each element.
This also consumes time and we do not want that.
To fix this, best approach I found is to empty the items of the store when destroying the widget.

[[[language=Smalltalk
gtkTreeView connectDestroy: [ 
	gtkTreeView model roots: #() ]
]]]
"
Class {
	#name : #GtkTreeDataStore,
	#superclass : #GtkTreeStore,
	#instVars : [
		'owner',
		'roots',
		'stamp',
		'childrenBlock',
		'images',
		'columns',
		'isList',
		'wrappedRoots',
		'holder',
		'sortedRoots'
	],
	#pools : [
		'GType',
		'GtkTreeModelFlags'
	],
	#category : #'Gtk-Widget-Tree-Store'
}

{ #category : #accessing }
GtkTreeDataStore class >> gClass [

	^ GClass gClassAt: self
]

{ #category : #'class initialization' }
GtkTreeDataStore class >> gDefine: gClass [

	gClass 
		parent: GtkTreeStore;
		addInterface: GtkTreeModelIface 
			initialize: [ :interface | self gDefineTreeStoreInterface: interface ];
		addInterface: GtkTreeDragSourceIface 
			initialize: [ :interface | self gDefineTreeDragSouceInterface: interface ];
		addInterface: GtkTreeDragDestIface 
			initialize: [ :interface | self gDefineTreeDragDestInterface: interface ]
]

{ #category : #'class initialization' }
GtkTreeDataStore class >> gDefineTreeDragDestInterface: iface [

	iface drag_data_received: (GCallback 
		signature: #(gboolean (void *drag_dest, void *dest, void *selection_data)) 
		block: [ :drag_source :path :selection_data | 
			(self gInstance: drag_source) 
				drag_data_received: (GtkTreePath fromHandle: path) 
				data: selection_data ]).
	iface row_drop_possible: (GCallback 
		signature: #(gboolean (void *drag_dest, void *dest, void *selection_data)) 
		block: [ :drag_source :path :selection_data | 
			(self gInstance: drag_source) 
				row_drop_possible: (GtkTreePath fromHandle: path) 
				data: selection_data ]).
]

{ #category : #'class initialization' }
GtkTreeDataStore class >> gDefineTreeDragSouceInterface: iface [

	iface row_draggable: (GCallback 
		signature: #(gboolean (void *drag_source, void *path)) 
		block: [ :drag_source :path | 
			(self gInstance: drag_source) row_draggable: (GtkTreePath fromHandle: path) ]).
	iface drag_data_get: (GCallback 
		signature: #(gboolean (void *drag_source, void *path, void *selection_data)) 
		block: [ :drag_source :path :selection_data | 
			(self gInstance: drag_source) 
				drag_data_get: (GtkTreePath fromHandle: path) 
				data: selection_data ]).
	iface drag_data_delete: (GCallback 
		signature: #(gboolean (void *drag_source, void *path)) 
		block: [ :drag_source :path |
			(self gInstance: drag_source) drag_data_delete: (GtkTreePath fromHandle: path) ]).

]

{ #category : #'class initialization' }
GtkTreeDataStore class >> gDefineTreeStoreInterface: iface [

	iface get_flags: (GCallback 
		signature: #("GtkTreeModelFlags"gint (void *tree_model)) 
		block: [ :tree_model | (self gInstance: tree_model) getFlags value ]).
	iface get_n_columns: (GCallback 
		signature: #(gint (void *tree_model)) 
		block: [ :tree_model | (self gInstance: tree_model) getNColumns ]).
	iface get_column_type: (GCallback 
		signature: #(gsize (void *tree_model, gint index)) 
		block: [ :tree_model :index | (self gInstance: tree_model) getColumnType: index ]).
	iface get_iter: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *path)) 
		block: [ :tree_model :iter :path | 
			(self gInstanceSafe: tree_model) 
				ifNotNil: [ :inst |
					inst
						getIter: (GtkTreePath fromHandle: path) 
						iter: (GtkTreeIter fromHandle: iter) ]
				ifNil: [ false ] ]).
	iface get_path: (GCallback 
		signature: #(GtkTreePath *(void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) getPath: (GtkTreeIter fromHandle: iter) ]).
	iface get_value: (GCallback 
		signature: #(void (void *tree_model, void *iter, gint column, void *value)) 
		block: [ :tree_model :iter :column :value |
			(self gInstanceSafe: tree_model) 
				ifNotNil: [ :inst |
					inst getValue: (GtkTreeIter fromHandle: iter) 
					column: column 
					value: (GValue fromHandle: value) ]]).
	iface iter_next: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter)) 
		block: [ :tree_model :iter |
			(self gInstanceSafe: tree_model) 
				ifNotNil: [ :inst |
					inst iterNext: (GtkTreeIter fromHandle: iter) ]
				ifNil: [ false ] ]).
	iface iter_children: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *parent)) 
		block: [ :tree_model :iter :parent | 
			(self gInstance: tree_model) 
				iterChildren: (GtkTreeIter fromHandle: parent) 
				iter: (GtkTreeIter fromHandle: iter) ]).
	iface iter_has_child: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) iterHasChild: (GtkTreeIter fromHandle: iter) ]).
	iface iter_n_children: (GCallback
		signature: #(gint (void *tree_model, void *iter)) 
		block: [ :tree_model :iter | 
			(self gInstance: tree_model) iterNChildren: (GtkTreeIter fromHandle: iter) ]).
	iface iter_nth_child: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *parent, gint n)) 
		block: [ :tree_model :iter :parent :n | 
			(self gInstanceSafe: tree_model) 
				ifNotNil: [ :inst |
					inst iterNthChild: (GtkTreeIter fromHandle: parent) 
						number: n 
						iter: (GtkTreeIter fromHandle: iter) ]
				ifNil: [ false ] ]).
	iface iter_parent: (GCallback 
		signature: #(gboolean (void *tree_model, void *iter, void *child)) 
		block: [ :tree_model :iter :child | 
			(self gInstance: tree_model) 
				iterParent: (GtkTreeIter fromHandle: child) 
				iter: (GtkTreeIter fromHandle: iter) ])
]

{ #category : #'class initialization' }
GtkTreeDataStore class >> gInstance: handle [

	^ self gClass findInstance: handle
]

{ #category : #'class initialization' }
GtkTreeDataStore class >> gInstanceSafe: handle [

	^ self gClass safeFindInstance: handle
]

{ #category : #'instance creation' }
GtkTreeDataStore class >> new [

	^ (GClass gDefinitionAt: self) new
]

{ #category : #accessing }
GtkTreeDataStore class >> sortResortThreashold [
	"More than this, sort will reset model (other than reorder rows)"

	^ 1000
]

{ #category : #accessing }
GtkTreeDataStore >> addColumn: aColumn [

	aColumn store: self.
	columns add: aColumn
]

{ #category : #private }
GtkTreeDataStore >> assertNotNull: anObject ifFail: aBlock [ 

	(anObject isNil or: [ anObject getHandle isNull ]) ifTrue: aBlock
]

{ #category : #private }
GtkTreeDataStore >> basicRoots [

	^ roots
]

{ #category : #accessing }
GtkTreeDataStore >> beList [

	isList := true
]

{ #category : #accessing }
GtkTreeDataStore >> children: aBlock [

	childrenBlock := aBlock
]

{ #category : #private }
GtkTreeDataStore >> childrenFor: element [

	childrenBlock ifNil: [ ^ #() ].
	^ childrenBlock value: element
]

{ #category : #accessing }
GtkTreeDataStore >> columns [

	^ columns
]

{ #category : #accessing }
GtkTreeDataStore >> columns: aCollection [

	columns := aCollection
]

{ #category : #'accessing drag source' }
GtkTreeDataStore >> drag_data_delete: path [

	^ false
]

{ #category : #'accessing drag source' }
GtkTreeDataStore >> drag_data_get: path data: selection_data [

	^ false
]

{ #category : #'accessing drag dest' }
GtkTreeDataStore >> drag_data_received: path data: selection_data [

	^ false
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getColumnType: index [

	^ (columns at: (index + 1)) gType
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getFlags [
	"GTK_TREE_MODEL_LIST_ONLY in case of a simple list (which is not the case in the experiment)"
	| flags |

	flags := GTK_TREE_MODEL_ITERS_PERSIST value.
	isList ifTrue: [ 
		 flags := flags | GTK_TREE_MODEL_LIST_ONLY value ].
	^ flags
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getIter: path iter: iter [
	| wrappedItem |

	self assertNotNull: path ifFail: [ ^ false ].

	wrappedItem := self wrappedItemAtPath: path ifAbsent: [ ^ false ].
	wrappedItem path 
		ifNil: [ wrappedItem path: path copy ].

	iter stamp: stamp.
	iter user_data: wrappedItem path.
	 
	^ true
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getNColumns [

	^ columns size
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getPath: iter [
	| path |

	self assertNotNull: iter ifFail: [ ^ ExternalAddress null ].
	self assertNotNull: iter user_data ifFail: [ ^ ExternalAddress null ].

	path := GtkTreePath fromHandle: iter user_data. 
	"This will be released by the caller"
	^ path copy getHandle
]

{ #category : #'accessing store' }
GtkTreeDataStore >> getValue: iter column: columnNumber value: gValue [
	| path wrappedItem column |

	self assertNotNull: iter ifFail: [ ^ self ].
	self assertNotNull: iter user_data ifFail: [ ^ self ].

	path := self pathFromIter: iter.
	wrappedItem := self 
		wrappedItemAtPath: path 
		ifAbsent: [ ^ self ].

	column := columns at: (columnNumber + 1).
	gValue init: column gType.
	column 
		setValueOf: wrappedItem item 
		path: path
		to: gValue
]

{ #category : #'private cache' }
GtkTreeDataStore >> imageAt: anObject ifAbsentPut: aBlock [

	^ images 
		at: anObject
		ifAbsentPut: aBlock
]

{ #category : #accessing }
GtkTreeDataStore >> indexOf: aTableColumn [
	"Answer the 'pure' column (the one that does not defines an attribute)"

	^ self indexOfColumnSuchAs: [ :aColumn | 
		aColumn column = aTableColumn
			and: [ aColumn tag isNil ] ]
]

{ #category : #accessing }
GtkTreeDataStore >> indexOf: aTableColumn tag: anObject [
	"Answer the 'pure' column (the one that does not defines an attribute)"

	^ self indexOfColumnSuchAs: [ :aColumn | 
		aColumn column = aTableColumn
			and: [ aColumn tag = anObject ] ]
]

{ #category : #accessing }
GtkTreeDataStore >> indexOfColumnSuchAs: aBlock [

	columns withIndexDo: [ :each :index |
		(aBlock value: each) 
			ifTrue: [ ^ index ] ].
	
	^ nil
]

{ #category : #initialization }
GtkTreeDataStore >> initialize [

	super initialize.
	stamp := 16rFFFF atRandom.
	isList := false.
	images := Dictionary new.
	columns := OrderedCollection new.
	wrappedRoots := OrderedCollection new.
	
	self registerForFinalize
]

{ #category : #accessing }
GtkTreeDataStore >> itemAtPath: pathArray [
	| wrappedItem |	

	wrappedItem := self 
		wrappedItemAt: pathArray first
		of: self wrappedRoots
		then: pathArray allButFirst.
		
	^ wrappedItem ifNotNil: [ wrappedItem item ]
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterChildren: parent iter: iter [
	| path wrappedItem child |

	self assertNotNull: parent ifFail: [ ^ false ].
	self assertNotNull: parent user_data ifFail: [ ^ false ].
	
	path := self pathFromIter: parent.
	wrappedItem := self 
		wrappedItemAtPath: path 
		ifAbsent: [ ^ false ].
	self retrieveChildrenIfNeeded: wrappedItem.
	wrappedItem hasChildren ifFalse: [ ^ false ].

	child := wrappedItem children first.
	child path ifNil: [ 
		child path: path copy down ].

	iter stamp: stamp. 
	iter user_data: child path.

	^ true
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterHasChild: iter [
	| wrappedItem path |

	childrenBlock ifNil: [ ^ false ].
	self assertNotNull: iter ifFail: [ ^ false ].
	self assertNotNull: iter user_data ifFail: [ ^ false ].

	path := self pathFromIter: iter.
	wrappedItem := self wrappedItemAtPath: path ifAbsent: [ ^ false ].
	self retrieveChildrenIfNeeded: wrappedItem.

	^ wrappedItem hasChildren
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterNChildren: iter [
	| wrappedItem path |

	childrenBlock ifNil: [ ^ 0 ].
	self assertNotNull: iter ifFail: [ ^ 0 ].
	self assertNotNull: iter user_data ifFail: [ ^ 0 ].

	path := self pathFromIter: iter.
	path toArray ifEmpty: [ ^ self roots size ].

	wrappedItem := self wrappedItemAtPath: path ifAbsent: [ ^ 0 ].
	self retrieveChildrenIfNeeded: wrappedItem.
	^ wrappedItem numberOfChildren
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterNext: iter [
	| path wrappedItem |

	self assertNotNull: iter ifFail:  [ ^ false ].	
	self assertNotNull: iter user_data ifFail:  [ ^ false ].	

	path := self pathFromIter: iter.
	path := path copy next.
	wrappedItem := self wrappedItemAtPath: path ifAbsent: [ nil ].
	wrappedItem ifNil: [
		path free.
		^ false ].

	wrappedItem path 
		ifNotNil: [ path free "I will not need this" ]
		ifNil: [ wrappedItem path: path ].
	
	iter stamp: stamp. 
	iter user_data: wrappedItem path.

	^ true
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterNthChild: parent number: n iter: iter [
	| path childNumber wrappedItem wrappedChild |

	self assertNotNull: parent ifFail: [ ^ false ].
	self assertNotNull: parent user_data ifFail: [ ^ false ].

	path := self pathFromIter: parent.
	wrappedItem := self wrappedItemAtPath: path.
	wrappedItem ifNil: [ ^ false ].

	self retrieveChildrenIfNeeded: wrappedItem.
	childNumber := n + 1. "n is zero based"	
	wrappedItem numberOfChildren < childNumber ifTrue: [ ^ false ].
	
	wrappedChild := wrappedItem childAt: childNumber.
	wrappedChild path ifNil: [ 
		wrappedChild path: (path copy 
			appendIndex: n;
			yourself) ].
	
	iter 
		stamp: stamp;
		user_data: wrappedChild path.

	^ true
]

{ #category : #'accessing store' }
GtkTreeDataStore >> iterParent: child iter: iter [
	| path wrappedItem |

	self assertNotNull: child ifFail: [ ^ false ].
	self assertNotNull: child user_data ifFail: [ ^ false ].
	
	path := self pathFromIter: child.

	path := path copy.
	path up ifFalse: [ 
		path free.
		^ false ].
	
	wrappedItem := self 
		wrappedItemAtPath: path 
		ifAbsent: [ 
			path free.
			^ false ].

	wrappedItem path
		ifNotNil: [ path free "I will not need this" ] 
		ifNil: [ wrappedItem path: path ].
		 
	iter stamp: stamp. 
	iter user_data: wrappedItem path.

	^ true
]

{ #category : #accessing }
GtkTreeDataStore >> owner [

	^ owner
]

{ #category : #accessing }
GtkTreeDataStore >> owner: aTreeView [

	owner := aTreeView
]

{ #category : #private }
GtkTreeDataStore >> pathFromIter: iter [

	^ GtkTreePath fromHandle: iter user_data
]

{ #category : #private }
GtkTreeDataStore >> prepareToDisconnect [
	"When destroying a model, Gtk will try to iterate all root elements on it. 
	 In case of large lists this may be an expensive task.
	 This method will reset all roots, so we do not have undesirable cycles"
		
	self roots: #().
	columns := OrderedCollection new.
	owner := nil.

]

{ #category : #initialization }
GtkTreeDataStore >> registerForFinalize [
	
	"I use 'stamp' and not self because I do not want the shallow copy of an external store, 
	 and stamp is a single number that will be collected along with it"
	self finalizationRegistry
		add: self
		executor: (GtkTreeDataStoreExecutor new 
			holder: (holder := Array with: nil);
			yourself)	
]

{ #category : #private }
GtkTreeDataStore >> resetWrappedRoots [

	wrappedRoots := nil
]

{ #category : #private }
GtkTreeDataStore >> retrieveChildrenIfNeeded: aWrappedItem [

	aWrappedItem needsChildren ifFalse: [ ^ self ].
	aWrappedItem wrapChildren: (self childrenFor: aWrappedItem item)
]

{ #category : #accessing }
GtkTreeDataStore >> roots [

	sortedRoots ifNotNil: [ ^ sortedRoots ].
	^ self basicRoots
]

{ #category : #accessing }
GtkTreeDataStore >> roots: aCollection [

	sortedRoots := nil.
	roots := aCollection.
	self resetWrappedRoots
]

{ #category : #'accessing drag source' }
GtkTreeDataStore >> row_draggable: path [

	^ true
]

{ #category : #'accessing drag dest' }
GtkTreeDataStore >> row_drop_possible: path data: selection_data [

	^ false
]

{ #category : #private }
GtkTreeDataStore >> rowsReorderedPath: path iter: iter newOrders: new_order [

	self ffiCall: #(void gtk_tree_model_rows_reordered (
		self, 
		GtkTreePath *path,
		GtkTreeIter *iter,
		gint *new_order))
]

{ #category : #sorting }
GtkTreeDataStore >> sortWith: aSortFunction [
	| newOrders |

	sortedRoots := self basicRoots sorted: aSortFunction.
	self resetWrappedRoots.
	
	sortedRoots size > self class sortResortThreashold ifTrue: [ 
		^ self owner setModel: self ].
	
	newOrders := ByteArray new: (FFIInt32 externalTypeSize * (sortedRoots size + 1)).
	self basicRoots withIndexDo: [ :each :index | 
		newOrders 
			signedLongAt: index 
			put: (sortedRoots indexOf: each) ].
	
	self
		rowsReorderedPath: GtkTreePath new 
		iter: GtkTreeIter null
		newOrders: newOrders
]

{ #category : #private }
GtkTreeDataStore >> wrappedItemAt: index of: anArray then: path [
	"dives into elements of tree to find the one that corresponds to path"
	| wrappedItem |
	
	anArray size < index ifTrue: [ ^ nil ].
	wrappedItem := anArray at: index.
	self retrieveChildrenIfNeeded: wrappedItem.	
	^ path 
		ifNotEmpty: [ 
			self 
				wrappedItemAt: path first 
				of: wrappedItem children 
				then: path allButFirst ]
		ifEmpty: [ 
			wrappedItem ]
]

{ #category : #private }
GtkTreeDataStore >> wrappedItemAtPath: path [
	| pathArray |

	self assertNotNull: path ifFail:  [ ^ nil ].
	pathArray := path toArray.
	^ self 
		wrappedItemAt: pathArray first
		of: self wrappedRoots
		then: pathArray allButFirst
]

{ #category : #private }
GtkTreeDataStore >> wrappedItemAtPath: path ifAbsent: aBlock [
	
	^ (self wrappedItemAtPath: path) ifNil: aBlock
]

{ #category : #private }
GtkTreeDataStore >> wrappedRoots [
		
	^ wrappedRoots ifNil: [ 
		wrappedRoots := self roots 
			withIndexCollect: [ :each :index | 
				GtkTreeDataWrapper new
					item: each;
					yourself ].
		holder at: 1 put: wrappedRoots.
		wrappedRoots ]
]
