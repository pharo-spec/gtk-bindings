Class {
	#name : 'GtkLinkButtonTest',
	#superclass : 'GtkBaseButtonTest',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'instance creation' }
GtkLinkButtonTest >> newWidget [

	^ self widgetClass newWithUri: ''
]

{ #category : 'accessing' }
GtkLinkButtonTest >> widgetClass [

	^ GtkLinkButton
]
