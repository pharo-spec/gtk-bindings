Class {
	#name : #GtkOverlayTest,
	#superclass : #GtkWidgetTest,
	#traits : 'GtkTBinTest',
	#classTraits : 'GtkTBinTest classTrait',
	#category : #'Gtk4-Tests-Widget'
}

{ #category : #accessing }
GtkOverlayTest >> newOverlayWidget [

	^ self childWidgetClass new
]

{ #category : #tests }
GtkOverlayTest >> testChild [
	"A simple test to verify setting a child will not crash the environment"

	self widget 
		child: self newChildWidget;
		addOverlay: self newOverlayWidget.
	self window child: self widget
]

{ #category : #accessing }
GtkOverlayTest >> widgetClass [

	^ GtkOverlay
]
