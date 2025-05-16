"
https://docs.gtk.org/gtk4/class.ListView.html
"
Class {
	#name : 'GtkListView',
	#superclass : 'GtkListBase',
	#instVars : [
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
GtkListView class >> gtkNew [


	^ self ffiCall: #(GtkListView *gtk_list_view_new (NULL, NULL))
	
]

{ #category : 'private' }
GtkListView >> clearModel [

	self ffiCall: #(void gtk_list_view_set_model (self, NULL))
]

{ #category : 'accessing' }
GtkListView >> enableRubberband: enable_rubberband [

	self ffiCall: #(void gtk_list_view_set_enable_rubberband (
		self,
  		gboolean enable_rubberband))
]

{ #category : 'private' }
GtkListView >> getFactory [

	^ self ffiCall: #(GtkListItemFactory* gtk_list_view_get_factory (self))
]

{ #category : 'private' }
GtkListView >> getHeaderFactory [

	^ self ffiCall: #(GtkListItemFactory* gtk_list_view_get_header_factory (self))
]

{ #category : 'private' }
GtkListView >> getModel [

	^ self ffiCall: #(GtkSelectionModel* gtk_list_view_get_model (self))
]

{ #category : 'accessing' }
GtkListView >> headerFactory [

	^ headerFactory ifNil: [ headerFactory := self getHeaderFactory ]
]

{ #category : 'accessing' }
GtkListView >> headerFactory: aFactory [

	headerFactory := aFactory.
	self setHeaderFactory: headerFactory.
	headerFactory objectUnrefNow
]

{ #category : 'testing' }
GtkListView >> isEnableRubberband [

	^ self ffiCall: #(gboolean gtk_list_view_get_enable_rubberband (self))
]

{ #category : 'testing' }
GtkListView >> isShowSeparators [

	^ self ffiCall: #(gboolean gtk_list_view_get_show_separators (self))
]

{ #category : 'testing' }
GtkListView >> isSingleClickActivate [

	^ self ffiCall: #(gboolean gtk_list_view_get_single_click_activate (self))
]

{ #category : 'accessing' }
GtkListView >> scrollToPosition: pos [

	^ self 
		scrollToPosition: pos 
		flags: GTK_LIST_SCROLL_NONE
		info: GObject null
]

{ #category : 'accessing' }
GtkListView >> scrollToPosition: pos flags: flags [

	^ self 
		scrollToPosition: pos 
		flags: flags 
		info: GObject null
]

{ #category : 'accessing' }
GtkListView >> scrollToPosition: pos flags: flags info: scroll [

	^ self ffiCall: #(void gtk_list_view_scroll_to (
		self,
  		guint pos,
  		GtkListScrollFlags flags,
  		GtkScrollInfo* scroll))
]

{ #category : 'private' }
GtkListView >> setFactory: aFactory [

	^ self ffiCall: #(void gtk_list_view_set_factory (
		self,
  		GtkListItemFactory* aFactory))
]

{ #category : 'private' }
GtkListView >> setHeaderFactory: aFactory [

	^ self ffiCall: #(void gtk_list_view_set_header_factory (
		self,
  		GtkListItemFactory* aFactory))
]

{ #category : 'private' }
GtkListView >> setModel: model [

	self ffiCall: #(void gtk_list_view_set_model (
		self,
  		GtkSelectionModel* model))
]

{ #category : 'accessing' }
GtkListView >> showSeparators: show_separators [

	self ffiCall: #(void gtk_list_view_set_show_separators (self,  gboolean show_separators))
]

{ #category : 'accessing' }
GtkListView >> singleClickActivate: single_click_activate [

	self ffiCall: #(void gtk_list_view_set_single_click_activate (
		self,
  		gboolean single_click_activate))



]

{ #category : 'accessing' }
GtkListView >> tabBehavior [

	self ffiCall: #(GtkListTabBehavior gtk_list_view_get_tab_behavior (self))

]

{ #category : 'accessing' }
GtkListView >> tabBehavior: tab_behavior [

	self ffiCall: #(void gtk_list_view_set_tab_behavior (self, GtkListTabBehavior tab_behavior))

]
