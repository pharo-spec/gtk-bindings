"
https://docs.gtk.org/gtk4/enum.ShortcutScope.html
"
Class {
	#name : #GtkShortcutScope,
	#superclass : #GEnumeration,
	#classVars : [
		'GTK_SHORTCUT_SCOPE_GLOBAL',
		'GTK_SHORTCUT_SCOPE_LOCAL',
		'GTK_SHORTCUT_SCOPE_MANAGED'
	],
	#category : #'Gtk-Event-Controllers'
}

{ #category : #'accessing enum' }
GtkShortcutScope class >> GTK_SHORTCUT_SCOPE_GLOBAL [
	"This method was automatically generated"
	^ GTK_SHORTCUT_SCOPE_GLOBAL
]

{ #category : #'accessing enum' }
GtkShortcutScope class >> GTK_SHORTCUT_SCOPE_LOCAL [
	"This method was automatically generated"
	^ GTK_SHORTCUT_SCOPE_LOCAL
]

{ #category : #'accessing enum' }
GtkShortcutScope class >> GTK_SHORTCUT_SCOPE_MANAGED [
	"This method was automatically generated"
	^ GTK_SHORTCUT_SCOPE_MANAGED
]

{ #category : #'enum declaration' }
GtkShortcutScope class >> enumDecl [

	^ #(
	GTK_SHORTCUT_SCOPE_LOCAL 	0
	GTK_SHORTCUT_SCOPE_MANAGED 	1	
	GTK_SHORTCUT_SCOPE_GLOBAL 	2
	)
]
