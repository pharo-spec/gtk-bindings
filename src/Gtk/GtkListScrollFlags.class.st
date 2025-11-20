"
https://docs.gtk.org/gtk4/flags.ListScrollFlags.html
"
Class {
	#name : 'GtkListScrollFlags',
	#superclass : 'GEnumeration',
	#classVars : [
		'GTK_LIST_SCROLL_FOCUS',
		'GTK_LIST_SCROLL_NONE',
		'GTK_LIST_SCROLL_SELECT'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'accessing enum' }
GtkListScrollFlags class >> GTK_LIST_SCROLL_FOCUS [
	"This method was automatically generated"
	^ GTK_LIST_SCROLL_FOCUS
]

{ #category : 'accessing enum' }
GtkListScrollFlags class >> GTK_LIST_SCROLL_NONE [
	"This method was automatically generated"
	^ GTK_LIST_SCROLL_NONE
]

{ #category : 'accessing enum' }
GtkListScrollFlags class >> GTK_LIST_SCROLL_SELECT [
	"This method was automatically generated"
	^ GTK_LIST_SCROLL_SELECT
]

{ #category : 'enum declaration' }
GtkListScrollFlags class >> enumDecl [
	"
	self initializeEnumeration; self rebuildEnumAccessors
	"
	^ {  
		#GTK_LIST_SCROLL_NONE      . 0.
		#GTK_LIST_SCROLL_FOCUS     . 1 << 0.
		#GTK_LIST_SCROLL_SELECT    . 1 << 1.
	}
]
