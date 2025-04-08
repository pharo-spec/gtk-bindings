"
https://docs.gtk.org/gtk4/class.GridView.html
"
Class {
	#name : 'GtkGridView',
	#superclass : 'GtkListBase',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkGridView class >> gtkNew [

	^ self ffiCall: #(GtkGridView *gtk_grid_view_new (NULL, NULL))
]

{ #category : 'accessing' }
GtkGridView >> enableRubberband: enable_rubberband [

	self ffiCall: #(void gtk_grid_view_set_enable_rubberband (self, gboolean enable_rubberband))
]

{ #category : 'private' }
GtkGridView >> getFactory [
	
	^ self ffiCall: #(GtkListItemFactory* gtk_grid_view_get_factory (self))
]

{ #category : 'private' }
GtkGridView >> getModel [

	^ self ffiCall: #(GtkSelectionModel* gtk_grid_view_get_model (self))
]

{ #category : 'accessing' }
GtkGridView >> maxColumns [

	^ self ffiCall: #(guint gtk_grid_view_get_max_columns (self))
]

{ #category : 'accessing' }
GtkGridView >> maxColumns: max_columns [

	self ffiCall: #(void gtk_grid_view_set_max_columns (self, guint max_columns))
]

{ #category : 'accessing' }
GtkGridView >> minColumns [

	^ self ffiCall: #(guint gtk_grid_view_get_min_columns (self))
]

{ #category : 'accessing' }
GtkGridView >> minColumns: min_columns [

	self ffiCall: #(void gtk_grid_view_set_min_columns (self, guint min_columns))
]

{ #category : 'private' }
GtkGridView >> setFactory: aFactory [
	
	self ffiCall: #(void gtk_grid_view_set_factory (self, GtkListItemFactory* aFactory))
]

{ #category : 'private' }
GtkGridView >> setModel: aModel [

	self ffiCall: #(void gtk_grid_view_set_model (self, GtkSelectionModel* aModel))
]

{ #category : 'accessing' }
GtkGridView >> singleClickActivate: single_click_activate [

	self ffiCall: #(void gtk_grid_view_set_single_click_activate (
  		self,
  		gboolean single_click_activate))
]
