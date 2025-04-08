"
GtkSearchEntry
GtkSearchEntry — An entry which shows a search icon

https://docs.gtk.org/gtk4/class.SearchEntry.html
"
Class {
	#name : 'GtkSearchEntry',
	#superclass : 'GtkWidget',
	#traits : 'GtkTEditable',
	#classTraits : 'GtkTEditable classTrait',
	#category : 'Gtk-Widget-Input',
	#package : 'Gtk',
	#tag : 'Widget-Input'
}

{ #category : 'accessing' }
GtkSearchEntry class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_search_entry_get_type())
]

{ #category : 'private' }
GtkSearchEntry class >> gtkSearchEntryNew [

	^ self ffiCall: #(GtkSearchEntry *gtk_search_entry_new (void))
]

{ #category : 'instance creation' }
GtkSearchEntry class >> new [

	^ self gtkSearchEntryNew initialize
]

{ #category : 'signaling' }
GtkSearchEntry >> connectActivate: aBlock [

	(GActivateCallback do: aBlock) connectTo: self
]

{ #category : 'signaling' }
GtkSearchEntry >> connectNextMatch: aBlock [

	^ self connect: 'next-match' do: aBlock
]

{ #category : 'signaling' }
GtkSearchEntry >> connectPreviousMatch: aBlock [

	^ self connect: 'previous-match' do: aBlock
]

{ #category : 'signaling' }
GtkSearchEntry >> connectSearchChanged: aBlock [

	^ self connect: 'search-changed' do: aBlock
]

{ #category : 'signaling' }
GtkSearchEntry >> connectStopSearch: aBlock [

	^ self connect: 'stop-search' do: aBlock
]

{ #category : 'as yet unclassified' }
GtkSearchEntry >> placeHolderText [

	self ffiCall: #(String gtk_search_entry_get_placeholder_text (self))
]

{ #category : 'as yet unclassified' }
GtkSearchEntry >> placeHolderText: text [

	self ffiCall: #(void gtk_search_entry_set_placeholder_text (self, String text))
]

{ #category : 'accessing' }
GtkSearchEntry >> searchDelay [

	self ffiCall: #(guint gtk_search_entry_get_search_delay (self))
]

{ #category : 'accessing' }
GtkSearchEntry >> searchDelay: delay [

	self ffiCall: #(void gtk_search_entry_set_search_delay (self, guint delay))
]
