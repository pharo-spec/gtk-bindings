Class {
	#name : 'GtkColumnViewColumn',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'factory'
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

{ #category : 'accessing' }
GtkColumnViewColumn >> title: title [

	self ffiCall: #(void gtk_column_view_column_set_title (self, const char* title))
]
