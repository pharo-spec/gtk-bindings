Class {
	#name : 'GtkTreeExpander',
	#superclass : 'GtkWidget',
	#traits : 'GtkTBin',
	#classTraits : 'GtkTBin classTrait',
	#instVars : [
		'listRow'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkTreeExpander class >> gtkNew [

	^ self ffiCall: #(GtkTreeExpander* gtk_tree_expander_new(void))
]

{ #category : 'instance creation' }
GtkTreeExpander class >> new [

	^ self gtkNew initialize
]

{ #category : 'accessing' }
GtkTreeExpander >> child [

	^ child ifNil: [ child := self getChild ]
]

{ #category : 'private' }
GtkTreeExpander >> getChild [

	^ self ffiCall: #(GtkWidget* gtk_tree_expander_get_child ())
]

{ #category : 'accessing' }
GtkTreeExpander >> listRow: aRow [ 

	listRow := aRow.
	self setListRow: aRow
]

{ #category : 'private' }
GtkTreeExpander >> setChild: aWidget [

	^ self ffiCall: #(void gtk_tree_expander_set_child (self, GtkWidget* aWidget))
]

{ #category : 'private' }
GtkTreeExpander >> setListRow: list_row [

	^ self ffiCall: #(void gtk_tree_expander_set_list_row (
		self,
 	 	"GtkTreeListRow*"GObject* list_row))
]
