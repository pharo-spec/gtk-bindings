"
https://docs.gtk.org/gtk4/flags.EventControllerScrollFlags.html
"
Class {
	#name : 'GtkEventControllerScrollFlags',
	#superclass : 'GEnumeration',
	#classVars : [
		'GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES',
		'GTK_EVENT_CONTROLLER_SCROLL_DISCRETE',
		'GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL',
		'GTK_EVENT_CONTROLLER_SCROLL_KINETIC',
		'GTK_EVENT_CONTROLLER_SCROLL_NONE',
		'GTK_EVENT_CONTROLLER_SCROLL_VERTICAL'
	],
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'accessing enum' }
GtkEventControllerScrollFlags class >> GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES [
	"This method was automatically generated"
	^ GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES
]

{ #category : 'accessing enum' }
GtkEventControllerScrollFlags class >> GTK_EVENT_CONTROLLER_SCROLL_DISCRETE [
	"This method was automatically generated"
	^ GTK_EVENT_CONTROLLER_SCROLL_DISCRETE
]

{ #category : 'accessing enum' }
GtkEventControllerScrollFlags class >> GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL [
	"This method was automatically generated"
	^ GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL
]

{ #category : 'accessing enum' }
GtkEventControllerScrollFlags class >> GTK_EVENT_CONTROLLER_SCROLL_KINETIC [
	"This method was automatically generated"
	^ GTK_EVENT_CONTROLLER_SCROLL_KINETIC
]

{ #category : 'accessing enum' }
GtkEventControllerScrollFlags class >> GTK_EVENT_CONTROLLER_SCROLL_NONE [
	"This method was automatically generated"
	^ GTK_EVENT_CONTROLLER_SCROLL_NONE
]

{ #category : 'accessing enum' }
GtkEventControllerScrollFlags class >> GTK_EVENT_CONTROLLER_SCROLL_VERTICAL [
	"This method was automatically generated"
	^ GTK_EVENT_CONTROLLER_SCROLL_VERTICAL
]

{ #category : 'enum declaration' }
GtkEventControllerScrollFlags class >> enumDecl [

	^ #(
	GTK_EVENT_CONTROLLER_SCROLL_NONE 				0
	GTK_EVENT_CONTROLLER_SCROLL_VERTICAL 		1
	GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL 		2
	GTK_EVENT_CONTROLLER_SCROLL_DISCRETE 		3
	GTK_EVENT_CONTROLLER_SCROLL_KINETIC 			4
	GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES 		5
	)
]
