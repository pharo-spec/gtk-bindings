Class {
	#name : #GtkNamedAction,
	#superclass : #GtkShortcutAction,
	#category : #'Gtk-Shortcut'
}

{ #category : #private }
GtkNamedAction class >> gtkNew: aName [ 

	^ self ffiCall: #(GtkNamedAction *gtk_named_action_new (char* aName))
]

{ #category : #'instance creation' }
GtkNamedAction class >> newName: aString [

	^ (self gtkNew: aString) initialize
]
