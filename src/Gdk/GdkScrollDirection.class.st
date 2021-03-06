Class {
	#name : #GdkScrollDirection,
	#superclass : #GEnumeration,
	#classVars : [
		'GDK_SCROLL_DOWN',
		'GDK_SCROLL_LEFT',
		'GDK_SCROLL_RIGHT',
		'GDK_SCROLL_SMOOTH',
		'GDK_SCROLL_UP'
	],
	#category : #'Gdk-Base'
}

{ #category : #'accessing enum' }
GdkScrollDirection class >> GDK_SCROLL_DOWN [
	"This method was automatically generated"
	^ GDK_SCROLL_DOWN
]

{ #category : #'accessing enum' }
GdkScrollDirection class >> GDK_SCROLL_LEFT [
	"This method was automatically generated"
	^ GDK_SCROLL_LEFT
]

{ #category : #'accessing enum' }
GdkScrollDirection class >> GDK_SCROLL_RIGHT [
	"This method was automatically generated"
	^ GDK_SCROLL_RIGHT
]

{ #category : #'accessing enum' }
GdkScrollDirection class >> GDK_SCROLL_SMOOTH [
	"This method was automatically generated"
	^ GDK_SCROLL_SMOOTH
]

{ #category : #'accessing enum' }
GdkScrollDirection class >> GDK_SCROLL_UP [
	"This method was automatically generated"
	^ GDK_SCROLL_UP
]

{ #category : #'enum declaration' }
GdkScrollDirection class >> enumDecl [
	"self initializeEnumeration"
	
	^ #(
  GDK_SCROLL_UP		0
  GDK_SCROLL_DOWN		1
  GDK_SCROLL_LEFT		2
  GDK_SCROLL_RIGHT		3
  GDK_SCROLL_SMOOTH	4
)
]

{ #category : #testing }
GdkScrollDirection >> isDown [ 

	^ value = GDK_SCROLL_DOWN
]

{ #category : #testing }
GdkScrollDirection >> isLeft [

	^ value = GDK_SCROLL_LEFT
]

{ #category : #testing }
GdkScrollDirection >> isRight [

	^ value = GDK_SCROLL_RIGHT
]

{ #category : #testing }
GdkScrollDirection >> isSmooth [

	^ value = GDK_SCROLL_SMOOTH
]

{ #category : #testing }
GdkScrollDirection >> isUp [ 

	^ value = self class GDK_SCROLL_UP
]
