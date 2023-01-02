Class {
	#name : #GtkMorphViewTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk4-Morphic-Tests'
}

{ #category : #'instance creation' }
GtkMorphViewTest >> newWidget [

	^ self widgetClass 
		morph: Morph new;
		yourself
]

{ #category : #accessing }
GtkMorphViewTest >> widgetClass [

	^ GtkMorphView
]
