Class {
	#name : #GtkActionBarTest,
	#superclass : #GtkWidgetTest,
	#traits : 'GtkTContainerTest',
	#classTraits : 'GtkTContainerTest classTrait',
	#category : #'Gtk4-Tests-Widget'
}

{ #category : #tests }
GtkActionBarTest >> testPackEnd [

	self widget packEnd: self newChildWidget.
	self assert: self widget children size equals: 1
]

{ #category : #tests }
GtkActionBarTest >> testPackStart [

	self widget packStart: self newChildWidget.
	self assert: self widget children size equals: 1
]

{ #category : #accessing }
GtkActionBarTest >> widgetClass [

	^ GtkActionBar
]