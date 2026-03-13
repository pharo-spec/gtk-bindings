Class {
	#name : 'GtkGridTest',
	#superclass : 'GtkWidgetTest',
	#traits : 'GtkTContainerTest',
	#classTraits : 'GtkTContainerTest classTrait',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'tests' }
GtkGridTest >> testAttachAt [

	self widget attach: self newChildWidget at: 1@1.
	self assert: self widget children size equals: 1
]

{ #category : 'accessing' }
GtkGridTest >> widgetClass [

	^ GtkGrid
]
