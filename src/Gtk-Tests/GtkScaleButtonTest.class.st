Class {
	#name : 'GtkScaleButtonTest',
	#superclass : 'GtkBaseButtonTest',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'instance creation' }
GtkScaleButtonTest >> newWidget [

	^ self widgetClass 
		newWithMin: 0.0 
		max: 10.0 
		step: 1.0
		icons: nil
]

{ #category : 'accessing' }
GtkScaleButtonTest >> widgetClass [

	^ GtkScaleButton
]
