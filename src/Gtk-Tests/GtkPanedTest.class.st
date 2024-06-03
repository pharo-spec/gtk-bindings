Class {
	#name : 'GtkPanedTest',
	#superclass : 'GtkWidgetTest',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'instance creation' }
GtkPanedTest >> newWidget [

	^ self widgetClass newVertical
]

{ #category : 'accessing' }
GtkPanedTest >> widgetClass [

	^ GtkPaned
]
