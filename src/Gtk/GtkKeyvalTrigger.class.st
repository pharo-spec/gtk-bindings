"
https://docs.gtk.org/gtk4/class.KeyvalTrigger.html
"
Class {
	#name : #GtkKeyvalTrigger,
	#superclass : #GtkShortcutTrigger,
	#category : #'Gtk-Shortcut'
}

{ #category : #private }
GtkKeyvalTrigger class >> gtkNewKeyval: keyval modifiers: modifiers [

	| aGtkKeyvalTrigger |
	aGtkKeyvalTrigger := self new.

	^ aGtkKeyvalTrigger ffiCall:
		  #( GtkKeyvalTrigger * gtk_keyval_trigger_new
		     #( guint keyval , GdkModifierType modifiers ) )
]

{ #category : #'instance creation' }
GtkKeyvalTrigger class >> newKeyval: keyval modifiers: modifiers [

	| aGtkKeyvalTrigger |
	aGtkKeyvalTrigger := self new.

	^ (aGtkKeyvalTrigger gtkNewKeyval: keyval modifiers: modifiers)
		  initialize
]
