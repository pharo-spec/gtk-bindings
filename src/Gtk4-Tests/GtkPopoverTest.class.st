Class {
	#name : #GtkPopoverTest,
	#superclass : #GtkWidgetTest,
	#traits : 'GtkTBinTest',
	#classTraits : 'GtkTBinTest classTrait',
	#category : #'Gtk4-Tests'
}

{ #category : #tests }
GtkPopoverTest >> testSmoke [

	self widget 
		present;
		popdown
]

{ #category : #accessing }
GtkPopoverTest >> widgetClass [

	^ GtkPopover
]
