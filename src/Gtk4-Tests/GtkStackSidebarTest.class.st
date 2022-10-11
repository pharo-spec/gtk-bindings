Class {
	#name : #GtkStackSidebarTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk4-Tests'
}

{ #category : #tests }
GtkStackSidebarTest >> testStack [

	self widget stack: GtkLabel new.
	self window child: self widget
]

{ #category : #accessing }
GtkStackSidebarTest >> widgetClass [

	^ GtkStackSidebar
]
