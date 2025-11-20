"
Used to customize the appearance of a GtkToolbar. Note that setting the toolbar style overrides the user’s preferences for the default toolbar style. Note that if the button has only a label set and GTK_TOOLBAR_ICONS is used, the label will be visible, and vice versa.

https://developer.gnome.org/gtk3/stable/gtk3-Standard-Enumerations.html#GtkToolbarStyle
"
Class {
	#name : 'GtkToolbarStyle',
	#superclass : 'GEnumeration',
	#classVars : [
		'GTK_TOOLBAR_BOTH',
		'GTK_TOOLBAR_BOTH_HORIZ',
		'GTK_TOOLBAR_ICONS',
		'GTK_TOOLBAR_TEXT'
	],
	#category : 'Gtk-Widget-Toolbar',
	#package : 'Gtk',
	#tag : 'Widget-Toolbar'
}

{ #category : 'accessing enum' }
GtkToolbarStyle class >> GTK_TOOLBAR_BOTH [
	"This method was automatically generated"
	^ GTK_TOOLBAR_BOTH
]

{ #category : 'accessing enum' }
GtkToolbarStyle class >> GTK_TOOLBAR_BOTH_HORIZ [
	"This method was automatically generated"
	^ GTK_TOOLBAR_BOTH_HORIZ
]

{ #category : 'accessing enum' }
GtkToolbarStyle class >> GTK_TOOLBAR_ICONS [
	"This method was automatically generated"
	^ GTK_TOOLBAR_ICONS
]

{ #category : 'accessing enum' }
GtkToolbarStyle class >> GTK_TOOLBAR_TEXT [
	"This method was automatically generated"
	^ GTK_TOOLBAR_TEXT
]

{ #category : 'enum declaration' }
GtkToolbarStyle class >> enumDecl [
	^ #(
	GTK_TOOLBAR_ICONS 	0
  	GTK_TOOLBAR_TEXT 	1
  	GTK_TOOLBAR_BOTH 	2
  	GTK_TOOLBAR_BOTH_HORIZ 	3	
	)
]

{ #category : 'testing' }
GtkToolbarStyle class >> isDeprecated [

	"apparently, we need to use a GtkBox with a style `toolbar`"
	^ true
]
