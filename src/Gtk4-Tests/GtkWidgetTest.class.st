Class {
	#name : #GtkWidgetTest,
	#superclass : #GtkBaseWithWindowTest,
	#instVars : [
		'widget'
	],
	#category : #'Gtk4-Tests'
}

{ #category : #testing }
GtkWidgetTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkWidgetTest ]
]

{ #category : #accessing }
GtkWidgetTest >> widget [

	^ widget ifNil: [ widget := GRunLoop defer: [ self widgetClass new ] ]
]

{ #category : #accessing }
GtkWidgetTest >> widgetClass [

	^ self subclassResponsibility
]
