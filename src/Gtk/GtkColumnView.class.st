Class {
	#name : 'GtkColumnView',
	#superclass : 'GtkListBase',
	#instVars : [
		'columns'
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
GtkColumnView >> getModel [

	self ffiCall: #(GtkSelectionModel* gtk_column_view_get_model (self))
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

{ #category : 'private' }
GtkColumnView >> setFactory: aFactory [
	
	self ffiCall: #(void gtk_column_view_set_row_factory (
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
GtkColumnView >> singleClickActivate: single_click_activate [

	self ffiCall: #(void gtk_column_view_set_single_click_activate (
		self,
		gboolean single_click_activate))
]
