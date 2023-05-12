Class {
	#name : #GtkMorphViewTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk-Morphic-Tests'
}

{ #category : #'instance creation' }
GtkMorphViewTest >> newWidget [

	^ self widgetClass new 
		morph: Morph new;
		yourself
]

{ #category : #accessing }
GtkMorphViewTest >> widgetClass [

	^ GtkMorphView
]
