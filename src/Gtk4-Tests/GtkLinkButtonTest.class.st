Class {
	#name : #GtkLinkButtonTest,
	#superclass : #GtkBaseButtonTest,
	#category : #'Gtk4-Tests-Widget'
}

{ #category : #'instance creation' }
GtkLinkButtonTest >> newWidget [

	^ self widgetClass newWithUri: ''
]

{ #category : #accessing }
GtkLinkButtonTest >> widgetClass [

	^ GtkLinkButton
]
