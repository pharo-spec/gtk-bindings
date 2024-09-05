Class {
	#name : 'GtkBoxTest',
	#superclass : 'GtkWidgetTest',
	#traits : 'GtkTContainerTest',
	#classTraits : 'GtkTContainerTest classTrait',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'instance creation' }
GtkBoxTest >> newWidget [

	^ self widgetClass newVertical
]

{ #category : 'tests' }
GtkBoxTest >> testAppend [

	self widget append: self newChildWidget.
	self assert: self widget children size equals: 1
]

{ #category : 'accessing' }
GtkBoxTest >> widgetClass [

	^ GtkBox
]
