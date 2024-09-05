"
https://docs.gtk.org/gtk4/flags.IconLookupFlags.html
"
Class {
	#name : 'GtkIconLookupFlags',
	#superclass : 'GEnumeration',
	#classVars : [
		'GTK_ICON_LOOKUP_FORCE_REGULAR',
		'GTK_ICON_LOOKUP_FORCE_SYMBOLIC',
		'GTK_ICON_LOOKUP_PRELOAD'
	],
	#category : 'Gtk-Widget-Display',
	#package : 'Gtk',
	#tag : 'Widget-Display'
}

{ #category : 'accessing enum' }
GtkIconLookupFlags class >> GTK_ICON_LOOKUP_FORCE_REGULAR [
	"This method was automatically generated"
	^ GTK_ICON_LOOKUP_FORCE_REGULAR
]

{ #category : 'accessing enum' }
GtkIconLookupFlags class >> GTK_ICON_LOOKUP_FORCE_SYMBOLIC [
	"This method was automatically generated"
	^ GTK_ICON_LOOKUP_FORCE_SYMBOLIC
]

{ #category : 'accessing enum' }
GtkIconLookupFlags class >> GTK_ICON_LOOKUP_PRELOAD [
	"This method was automatically generated"
	^ GTK_ICON_LOOKUP_PRELOAD
]

{ #category : 'enum declaration' }
GtkIconLookupFlags class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors"

	^ #(
	GTK_ICON_LOOKUP_FORCE_REGULAR 		0
	GTK_ICON_LOOKUP_FORCE_SYMBOLIC 	1
	GTK_ICON_LOOKUP_PRELOAD				2
	)
]
