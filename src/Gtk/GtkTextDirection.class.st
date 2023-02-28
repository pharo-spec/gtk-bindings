Class {
	#name : #GtkTextDirection,
	#superclass : #GEnumeration,
	#classVars : [
		'GTK_TEXT_DIR_LTR',
		'GTK_TEXT_DIR_NONE',
		'GTK_TEXT_DIR_RTL'
	],
	#category : #'Gtk-Widget-Display'
}

{ #category : #'accessing enum' }
GtkTextDirection class >> GTK_TEXT_DIR_LTR [
	"This method was automatically generated"
	^ GTK_TEXT_DIR_LTR
]

{ #category : #'accessing enum' }
GtkTextDirection class >> GTK_TEXT_DIR_NONE [
	"This method was automatically generated"
	^ GTK_TEXT_DIR_NONE
]

{ #category : #'accessing enum' }
GtkTextDirection class >> GTK_TEXT_DIR_RTL [
	"This method was automatically generated"
	^ GTK_TEXT_DIR_RTL
]

{ #category : #'enum declaration' }
GtkTextDirection class >> enumDecl [
	"
	self initializeEnumeration.
	self rebuildEnumAccessors
	"

	^ #(
	GTK_TEXT_DIR_NONE 		0
	GTK_TEXT_DIR_LTR 		1
	GTK_TEXT_DIR_RTL 		2
	)
]
