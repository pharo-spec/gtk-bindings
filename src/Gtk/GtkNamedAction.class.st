"
https://docs.gtk.org/gtk4/class.NamedAction.html
"
Class {
	#name : 'GtkNamedAction',
	#superclass : 'GtkShortcutAction',
	#instVars : [
		'name'
	],
	#category : 'Gtk-Shortcut',
	#package : 'Gtk',
	#tag : 'Shortcut'
}

{ #category : 'private' }
GtkNamedAction class >> gtkNew: aName [ 

	^ self ffiCall: #(GtkNamedAction *gtk_named_action_new (char* aName))
]

{ #category : 'instance creation' }
GtkNamedAction class >> newName: aString [

	^ (self gtkNew: aString) initializeName: aString
]

{ #category : 'initialization' }
GtkNamedAction >> initializeName: aName [ 

	name := aName.
	self initialize
]

{ #category : 'accessing' }
GtkNamedAction >> name [

	^ name
]
