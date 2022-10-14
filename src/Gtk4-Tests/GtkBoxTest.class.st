Class {
	#name : #GtkBoxTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk4-Tests-Widget'
}

{ #category : #'instance creation' }
GtkBoxTest >> newChildWidget [

	^ GtkLabel newLabel: 'Test'
]

{ #category : #'instance creation' }
GtkBoxTest >> newWidget [

	^ self widgetClass newVertical
]

{ #category : #tests }
GtkBoxTest >> testAppend [

	self widget append: self newChildWidget.
	self assert: self widget children size equals: 1
]

{ #category : #accessing }
GtkBoxTest >> widgetClass [

	^ GtkBox
]
