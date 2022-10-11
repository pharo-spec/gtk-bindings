"
GtkSearchBar
GtkSearchBar — A toolbar to integrate a search entry with

https://docs.gtk.org/gtk4/class.SearchBar.html
"
Class {
	#name : #GtkSearchBar,
	#superclass : #GtkWidget,
	#traits : 'GtkTBin',
	#classTraits : 'GtkTBin classTrait',
	#category : #'Gtk-Widget-Input'
}

{ #category : #accessing }
GtkSearchBar class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_search_bar_get_type())
]

{ #category : #private }
GtkSearchBar class >> gtkSearchBarNew [

	^ self ffiCall: #(GtkSearchBar *gtk_search_bar_new (void))
]

{ #category : #'instance creation' }
GtkSearchBar class >> new [

	^ self gtkSearchBarNew initialize
]

{ #category : #accessing }
GtkSearchBar >> connectEntry: anEntry [

	^ self ffiCall: #(void gtk_search_bar_connect_entry (self, GtkEntry *anEntry))
]

{ #category : #accessing }
GtkSearchBar >> handleEvent: anEvent [

	^ self ffiCall: #(gboolean gtk_search_bar_handle_event (self, GdkEvent *anEvent))
]

{ #category : #accessing }
GtkSearchBar >> hideCloseButton [

	^ self showCloseButton: false
]

{ #category : #testing }
GtkSearchBar >> isSearchModeOn [

	^ self ffiCall: #(gboolean gtk_search_bar_get_search_mode (self))
]

{ #category : #accessing }
GtkSearchBar >> searchMode: aBoolean [

	^ self ffiCall: #(void gtk_search_bar_set_search_mode (self, gboolean aBoolean))
]

{ #category : #accessing }
GtkSearchBar >> searchModeOff [

	self searchMode: false
]

{ #category : #accessing }
GtkSearchBar >> searchModeOn [

	self searchMode: true
]

{ #category : #private }
GtkSearchBar >> setChild: aWidget [

	self ffiCall: #(void gtk_search_bar_set_child (self, GtkWidget* aWidget))
]

{ #category : #accessing }
GtkSearchBar >> showCloseButton [

	^ self showCloseButton: true
]

{ #category : #accessing }
GtkSearchBar >> showCloseButton: aBoolean [

	^ self ffiCall: #(void gtk_search_bar_set_show_close_button (self, gboolean aBoolean))
]

{ #category : #testing }
GtkSearchBar >> showsCloseButton [

	^ self ffiCall: #(gboolean gtk_search_bar_get_show_close_button (self))
]
