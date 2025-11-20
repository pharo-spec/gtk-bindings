"
https://docs.gtk.org/gtk4/class.ColumnViewColumn.html
"
Class {
	#name : 'GtkColumnViewColumn',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'factory',
		'sorter'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'instance creation' }
GtkColumnViewColumn class >> gtkColumnViewColumnNew [

	^ self ffiCall: #(GtkColumnViewColumn* gtk_column_view_column_new (NULL, NULL))
]

{ #category : 'instance creation' }
GtkColumnViewColumn class >> new [

	^ self gtkColumnViewColumnNew initialize
]

{ #category : 'accessing' }
GtkColumnViewColumn >> expand: expand [

	self ffiCall: #(void gtk_column_view_column_set_expand (self, gboolean expand))
]

{ #category : 'accessing' }
GtkColumnViewColumn >> factory [

	^ factory
]

{ #category : 'accessing' }
GtkColumnViewColumn >> factory: aFactory [

	factory := aFactory.
	self setFactory: aFactory.
	aFactory objectUnrefNow
]

{ #category : 'accessing' }
GtkColumnViewColumn >> fixedWidth [

	^ self ffiCall: #(int gtk_column_view_column_get_fixed_width (self))
]

{ #category : 'accessing' }
GtkColumnViewColumn >> fixedWidth: fixed_width [

	self ffiCall: #(void gtk_column_view_column_set_fixed_width (
		self,
  		int fixed_width))
]

{ #category : 'testing' }
GtkColumnViewColumn >> isExpand [

	^ self ffiCall: #(gboolean gtk_column_view_column_get_expand (self))
]

{ #category : 'testing' }
GtkColumnViewColumn >> isResizable [

	^ self ffiCall: #(gboolean gtk_column_view_column_get_resizable (self))
]

{ #category : 'testing' }
GtkColumnViewColumn >> isSortable [

	^ self sorter isNotNil
]

{ #category : 'accessing' }
GtkColumnViewColumn >> resizable: resizable [

	self ffiCall: #(void gtk_column_view_column_set_resizable (
		self,
  		gboolean resizable))
]

{ #category : 'private' }
GtkColumnViewColumn >> setFactory: aFactory [ 

	self ffiCall: #(void gtk_column_view_column_set_factory (
		self,
  		GtkListItemFactory* aFactory))
]

{ #category : 'private' }
GtkColumnViewColumn >> setSorter: aSorter [

	self ffiCall: #(void gtk_column_view_column_set_sorter (self, GtkSorter* aSorter))
]

{ #category : 'accessing' }
GtkColumnViewColumn >> sorter [

	^ sorter
]

{ #category : 'accessing' }
GtkColumnViewColumn >> sorter: aSorter [

	sorter := aSorter.
	self setSorter: aSorter.
	sorter objectUnrefNow
]

{ #category : 'accessing' }
GtkColumnViewColumn >> title: title [

	self ffiCall: #(void gtk_column_view_column_set_title (self, const char* title))
]
