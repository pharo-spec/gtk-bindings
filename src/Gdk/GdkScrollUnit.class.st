"
https://docs.gtk.org/gdk4/enum.ScrollUnit.html
"
Class {
	#name : #GdkScrollUnit,
	#superclass : #GEnumeration,
	#classVars : [
		'GDK_SCROLL_UNIT_SURFACE',
		'GDK_SCROLL_UNIT_WHEEL'
	],
	#category : #'Gdk-Base'
}

{ #category : #'accessing enum' }
GdkScrollUnit class >> GDK_SCROLL_UNIT_SURFACE [
	"This method was automatically generated"
	^ GDK_SCROLL_UNIT_SURFACE
]

{ #category : #'accessing enum' }
GdkScrollUnit class >> GDK_SCROLL_UNIT_WHEEL [
	"This method was automatically generated"
	^ GDK_SCROLL_UNIT_WHEEL
]

{ #category : #'enum declaration' }
GdkScrollUnit class >> enumDecl [
	"self initializeEnumeration.
	 self rebuildEnumAccessors"
	
	^ #(
	GDK_SCROLL_UNIT_WHEEL 		0
	GDK_SCROLL_UNIT_SURFACE 		1
	)
]
