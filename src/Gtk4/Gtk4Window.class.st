Class {
	#name : #Gtk4Window,
	#superclass : #Gtk4Widget,
	#instVars : [
		'child'
	],
	#category : #Gtk4
}

{ #category : #'as yet unclassified' }
Gtk4Window class >> gtkNew [

	^ self ffiCall: #(#Gtk4Window *gtk_window_new ())
]

{ #category : #'instance creation' }
Gtk4Window class >> new [

	^ self gtkNew initialize
]

{ #category : #'as yet unclassified' }
Gtk4Window >> child: aWidget [

	child := aWidget.
	self gtkSetChild: aWidget
]

{ #category : #showing }
Gtk4Window >> close [

	self ffiCall: #(void gtk_window_close (self))
]

{ #category : #'as yet unclassified' }
Gtk4Window >> gtkSetChild: child [

	self ffiCall: #(void gtk_window_set_child (self, GtkWidget *child))
]

{ #category : #showing }
Gtk4Window >> present [

	^ self ffiCall: #(void gtk_window_present (self))
]
