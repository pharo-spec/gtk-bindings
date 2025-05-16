"
https://docs.gtk.org/gtk4/class.ColumnView.html
"
Class {
	#name : 'GtkColumnView',
	#superclass : 'GtkListBase',
	#instVars : [
		'columns',
		'headerFactory'
	],
	#pools : [
		'GtkListScrollFlags'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkColumnView class >> gtkColumnViewNew [

	^ self ffiCall: #(GtkColumnView* gtk_column_view_new (NULL))
]

{ #category : 'instance creation' }
GtkColumnView class >> new [

	^ self gtkColumnViewNew initialize
]

{ #category : 'columns' }
GtkColumnView >> appendColumn: aColumn [

	self keepColumn: aColumn.
	self basicAppendColumn: aColumn.
	aColumn objectUnrefNow
]

{ #category : 'private' }
GtkColumnView >> basicAppendColumn: column [

	self ffiCall: #(void gtk_column_view_append_column (
		self,
  		GtkColumnViewColumn* column))
]

{ #category : 'private' }
GtkColumnView >> basicInsertColumn: column atPosition: position [

	self ffiCall: #(void gtk_column_view_insert_column (
  		self,
  		guint position,
		GtkColumnViewColumn* column))
]

{ #category : 'private' }
GtkColumnView >> basicRemoveColumn: column [

	self ffiCall: #(void gtk_column_view_remove_column (
		self,
		GtkColumnViewColumn* column))
]

{ #category : 'columns' }
GtkColumnView >> columns [

	^ columns
]

{ #category : 'accessing' }
GtkColumnView >> enableRubberband: enable_rubberband [

	self ffiCall: #(void gtk_column_view_set_enable_rubberband (
		self,
  		gboolean enable_rubberband))
]

{ #category : 'private' }
GtkColumnView >> getFactory [
	
	^ self ffiCall: #(GtkListItemFactory* gtk_column_view_get_row_factory (self))
]

{ #category : 'private' }
GtkColumnView >> getHeaderFactory [

	^ self ffiCall: #(GtkListItemFactory* gtk_list_view_get_header_factory (self))
]

{ #category : 'private' }
GtkColumnView >> getModel [

	self ffiCall: #(GtkSelectionModel* gtk_column_view_get_model (self))
]

{ #category : 'accessing' }
GtkColumnView >> headerFactory [

	^ headerFactory ifNil: [ headerFactory := self getHeaderFactory ]
]

{ #category : 'accessing' }
GtkColumnView >> headerFactory: aFactory [

	headerFactory := aFactory.
	self setHeaderFactory: headerFactory.
	headerFactory objectUnrefNow
]

{ #category : 'initialization' }
GtkColumnView >> initialize [

	super initialize.
	columns := OrderedCollection new
]

{ #category : 'columns' }
GtkColumnView >> insertColumn: aColumn atPosition: index [

	self keepColumn: aColumn.
	self basicInsertColumn: aColumn atPosition: index - 1.
	aColumn objectUnrefNow
]

{ #category : 'private' }
GtkColumnView >> keepColumn: aColumn [

	columns add: aColumn
]

{ #category : 'columns' }
GtkColumnView >> removeColumn: aColumn [

	self basicRemoveColumn: aColumn.
	columns remove: aColumn
]

{ #category : 'accessing' }
GtkColumnView >> scrollToPosition: index [

	self 
		scrollToPosition: index
		flags: GTK_LIST_SCROLL_FOCUS
]

{ #category : 'accessing' }
GtkColumnView >> scrollToPosition: pos flags: flags [ 
	
	self ffiCall: #(void gtk_column_view_scroll_to (
		self,
		guint pos,
  		"GtkColumnViewColumn* column"NULL,
  		GtkListScrollFlags flags,
  		"GtkScrollInfo* scroll"NULL))
]

{ #category : 'private' }
GtkColumnView >> setFactory: aFactory [
	
	self ffiCall: #(void gtk_column_view_set_row_factory (
		self,
  		GtkListItemFactory* aFactory))
]

{ #category : 'private' }
GtkColumnView >> setHeaderFactory: aFactory [

	^ self ffiCall: #(void gtk_column_view_set_header_factory (
		self,
  		GtkListItemFactory* aFactory))
]

{ #category : 'private' }
GtkColumnView >> setModel: aModel [

	self ffiCall: #(void gtk_column_view_set_model (
  		self,
  		GtkSelectionModel *aModel))
]

{ #category : 'accessing' }
GtkColumnView >> showColumnSeparators: show_column_separators [
	
	self ffiCall: #(void gtk_column_view_set_show_column_separators (
		self,
		gboolean show_column_separators))
]

{ #category : 'accessing' }
GtkColumnView >> showRowSeparators: show_row_separators [
	
	self ffiCall: #(void gtk_column_view_set_show_row_separators (
		self,
		gboolean show_row_separators))
]

{ #category : 'accessing' }
GtkColumnView >> singleClickActivate: single_click_activate [

	self ffiCall: #(void gtk_column_view_set_single_click_activate (
		self,
		gboolean single_click_activate))
]

{ #category : 'accessing' }
GtkColumnView >> tabBehavior [

	self ffiCall: #(GtkListTabBehavior gtk_column_view_get_tab_behavior (self))

]

{ #category : 'accessing' }
GtkColumnView >> tabBehavior: tab_behavior [

	self ffiCall: #(void gtk_column_view_set_tab_behavior (self, GtkListTabBehavior tab_behavior))

]
