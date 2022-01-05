"
Used to reference the parts of GtkTextView.

https://developer-old.gnome.org/gtk3/stable/GtkTextView.html#GtkTextWindowType
"
Class {
	#name : #GtkTextWindowType,
	#superclass : #GEnumeration,
	#classVars : [
		'GTK_TEXT_WINDOW_BOTTOM',
		'GTK_TEXT_WINDOW_LEFT',
		'GTK_TEXT_WINDOW_PRIVATE',
		'GTK_TEXT_WINDOW_RIGHT',
		'GTK_TEXT_WINDOW_TEXT',
		'GTK_TEXT_WINDOW_TOP',
		'GTK_TEXT_WINDOW_WIDGET'
	],
	#category : #'Gtk-Widget'
}

{ #category : #'accessing enum' }
GtkTextWindowType class >> GTK_TEXT_WINDOW_BOTTOM [
	"This method was automatically generated"
	^ GTK_TEXT_WINDOW_BOTTOM
]

{ #category : #'accessing enum' }
GtkTextWindowType class >> GTK_TEXT_WINDOW_LEFT [
	"This method was automatically generated"
	^ GTK_TEXT_WINDOW_LEFT
]

{ #category : #'accessing enum' }
GtkTextWindowType class >> GTK_TEXT_WINDOW_PRIVATE [
	"This method was automatically generated"
	^ GTK_TEXT_WINDOW_PRIVATE
]

{ #category : #'accessing enum' }
GtkTextWindowType class >> GTK_TEXT_WINDOW_RIGHT [
	"This method was automatically generated"
	^ GTK_TEXT_WINDOW_RIGHT
]

{ #category : #'accessing enum' }
GtkTextWindowType class >> GTK_TEXT_WINDOW_TEXT [
	"This method was automatically generated"
	^ GTK_TEXT_WINDOW_TEXT
]

{ #category : #'accessing enum' }
GtkTextWindowType class >> GTK_TEXT_WINDOW_TOP [
	"This method was automatically generated"
	^ GTK_TEXT_WINDOW_TOP
]

{ #category : #'accessing enum' }
GtkTextWindowType class >> GTK_TEXT_WINDOW_WIDGET [
	"This method was automatically generated"
	^ GTK_TEXT_WINDOW_WIDGET
]

{ #category : #'enum declaration' }
GtkTextWindowType class >> enumDecl [

	^ #(
	GTK_TEXT_WINDOW_PRIVATE 	0
	GTK_TEXT_WINDOW_WIDGET 	1
	GTK_TEXT_WINDOW_TEXT 		2
	GTK_TEXT_WINDOW_LEFT 		3
	GTK_TEXT_WINDOW_RIGHT 	4
	GTK_TEXT_WINDOW_TOP 		5
	GTK_TEXT_WINDOW_BOTTOM 	6)
]
