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

{ #category : 'columns' }
GtkColumnView >> columns [

	^ columns
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
GtkColumnView >> insertColumn: aColumn atIndex: index [

	self keepColumn: aColumn.
	self basicInsertColumn: aColumn atIndex: index
]

{ #category : 'private' }
GtkColumnView >> keepColumn: aColumn [

	columns add: aColumn
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
