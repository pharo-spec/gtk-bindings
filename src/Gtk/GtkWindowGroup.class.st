"
https://docs.gtk.org/gtk4/class.WindowGroup.html
"
Class {
	#name : 'GtkWindowGroup',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'windows'
	],
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'private' }
GtkWindowGroup class >> gtk_window_group_new [

	self ffiCall: #(GtkWindowGroup* gtk_window_group_new (void))
]

{ #category : 'instance creation' }
GtkWindowGroup class >> new [

	^ self gtk_window_group_new initialize
]

{ #category : 'accessing' }
GtkWindowGroup >> addWindow: aWindow [

	windows := self windows copyWith: aWindow.
	self basicAddWindow: aWindow
]

{ #category : 'private' }
GtkWindowGroup >> basicAddWindow: window [

	self ffiCall: #(void gtk_window_group_add_window (self, GtkWindow* window))
]

{ #category : 'accessing' }
GtkWindowGroup >> windows [

	^ windows ifNil: [ #() ]
]
