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
GtkColumnViewColumn >> factory: aFactory [

	factory := aFactory.
	self setFactory: aFactory.
	aFactory objectUnrefNow
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
