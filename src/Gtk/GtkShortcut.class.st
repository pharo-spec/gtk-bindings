"
https://docs.gtk.org/gtk4/class.Shortcut.html
"
Class {
	#name : #GtkShortcut,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'action',
		'trigger'
	],
	#category : #'Gtk-Shortcut'
}

{ #category : #private }
GtkShortcut class >> gtkNew [

	self ffiCall: #(GtkShortcut* gtk_shortcut_new (NULL, NULL))
]

{ #category : #'instance creation' }
GtkShortcut class >> new [

	^ self gtkNew
]

{ #category : #accessing }
GtkShortcut >> action: anAction [

	action := anAction.
	self setAction: anAction
]

{ #category : #'private - primitives' }
GtkShortcut >> setAction: anAction [

	self ffiCall: #(void gtk_shortcut_set_action (self, GtkShortcutAction* anAction))
]

{ #category : #'private - primitives' }
GtkShortcut >> setTrigger: aTrigger [

	self ffiCall: #(void gtk_shortcut_set_trigger (self, GtkShortcutTrigger* aTrigger))
]

{ #category : #accessing }
GtkShortcut >> trigger: aTrigger [

	trigger := aTrigger.
	self setTrigger: aTrigger
]
