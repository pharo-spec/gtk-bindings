Class {
	#name : #GtkScaleButtonTest,
	#superclass : #GtkBaseButtonTest,
	#category : #'Gtk4-Tests-Widget'
}

{ #category : #'instance creation' }
GtkScaleButtonTest >> newWidget [

	^ self widgetClass 
		newWithMin: 0.0 
		max: 10.0 
		step: 1.0
		icons: nil
]

{ #category : #accessing }
GtkScaleButtonTest >> widgetClass [

	^ GtkScaleButton
]
