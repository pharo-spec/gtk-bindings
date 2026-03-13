Class {
	#name : 'GtkStackSidebarTest',
	#superclass : 'GtkWidgetTest',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'tests' }
GtkStackSidebarTest >> testStack [

	self widget stack: GtkLabel new.
	self window child: self widget
]

{ #category : 'accessing' }
GtkStackSidebarTest >> widgetClass [

	^ GtkStackSidebar
]
