"
https://docs.gtk.org/gtk4//enum.ListTabBehavior.html
"
Class {
	#name : 'GtkListTabBehavior',
	#superclass : 'GEnumeration',
	#classVars : [
		'GTK_LIST_TAB_ALL',
		'GTK_LIST_TAB_CELL',
		'GTK_LIST_TAB_ITEM'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'accessing enum' }
GtkListTabBehavior class >> GTK_LIST_TAB_ALL [
	"This method was automatically generated"
	^ GTK_LIST_TAB_ALL
]

{ #category : 'accessing enum' }
GtkListTabBehavior class >> GTK_LIST_TAB_CELL [
	"This method was automatically generated"
	^ GTK_LIST_TAB_CELL
]

{ #category : 'accessing enum' }
GtkListTabBehavior class >> GTK_LIST_TAB_ITEM [
	"This method was automatically generated"
	^ GTK_LIST_TAB_ITEM
]

{ #category : 'enum declaration' }
GtkListTabBehavior class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors
	"

	^ #(
	GTK_LIST_TAB_ALL 		0
	GTK_LIST_TAB_ITEM 		1
	GTK_LIST_TAB_CELL		2
	)
]
