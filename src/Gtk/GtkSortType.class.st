"
enum GtkSortType

Determines the direction of a sort.

https://developer.gnome.org/gtk3/stable/gtk3-Standard-Enumerations.html#GtkSortType


"
Class {
	#name : #GtkSortType,
	#superclass : #GEnumeration,
	#classVars : [
		'GTK_SORT_ASCENDING',
		'GTK_SORT_DESCENDING'
	],
	#category : #'Gtk-Misc'
}

{ #category : #'accessing enum' }
GtkSortType class >> GTK_SORT_ASCENDING [
	"This method was automatically generated"
	^ GTK_SORT_ASCENDING
]

{ #category : #'accessing enum' }
GtkSortType class >> GTK_SORT_DESCENDING [
	"This method was automatically generated"
	^ GTK_SORT_DESCENDING
]

{ #category : #'enum declaration' }
GtkSortType class >> enumDecl [
	"self initializeEnumeration.
	 self rebuildEnumAccessors"
	
	^ #(  	
	GTK_SORT_ASCENDING			0
	GTK_SORT_DESCENDING 		1
	)
]
