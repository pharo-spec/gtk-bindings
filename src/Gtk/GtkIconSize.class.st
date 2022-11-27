"
Built-in stock icon sizes.

https://developer.gnome.org/gtk3/stable/gtk3-Themeable-Stock-Images.html#GtkIconSize
"
Class {
	#name : #GtkIconSize,
	#superclass : #GEnumeration,
	#classVars : [
		'GTK_ICON_SIZE_INHERIT',
		'GTK_ICON_SIZE_LARGE',
		'GTK_ICON_SIZE_NORMAL'
	],
	#category : #'Gtk-Misc'
}

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_INHERIT [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_INHERIT
]

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_LARGE [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_LARGE
]

{ #category : #'accessing enum' }
GtkIconSize class >> GTK_ICON_SIZE_NORMAL [
	"This method was automatically generated"
	^ GTK_ICON_SIZE_NORMAL
]

{ #category : #'enum declaration' }
GtkIconSize class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors"

	^ #(
	GTK_ICON_SIZE_INHERIT 	0
	GTK_ICON_SIZE_NORMAL 	 	1
	GTK_ICON_SIZE_LARGE		2
)
]
