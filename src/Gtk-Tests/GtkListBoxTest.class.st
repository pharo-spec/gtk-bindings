Class {
	#name : 'GtkListBoxTest',
	#superclass : 'GtkWidgetTest',
	#traits : 'GtkTContainerTest',
	#classTraits : 'GtkTContainerTest classTrait',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'tests' }
GtkListBoxTest >> testAppend [
	"A simple test to verify setting a child will not crash the environment"

	self widget add: self newChildWidget.
	self window child: self widget
]

{ #category : 'accessing' }
GtkListBoxTest >> widgetClass [

	^ GtkListBox
]
