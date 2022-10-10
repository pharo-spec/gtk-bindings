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

{ #category : #accessing }
Gtk4Window >> child [

	^ child ifNil: [ child := self getChild ]
]

{ #category : #accessing }
Gtk4Window >> child: aWidget [

	child := aWidget.
	self setChild: aWidget
]

{ #category : #showing }
Gtk4Window >> close [

	self ffiCall: #(void gtk_window_close (self))
]

{ #category : #private }
Gtk4Window >> getChild [

	self ffiCall: #(GtkWidget *gtk_window_get_child (self))
]

{ #category : #showing }
Gtk4Window >> present [

	^ self ffiCall: #(void gtk_window_present (self))
]

{ #category : #private }
Gtk4Window >> setChild: aWidget [

	self ffiCall: #(void gtk_window_set_child (self, GtkWidget *aWidget))
]
