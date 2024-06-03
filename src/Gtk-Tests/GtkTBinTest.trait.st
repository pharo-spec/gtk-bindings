Trait {
	#name : 'GtkTBinTest',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'accessing' }
GtkTBinTest >> childWidgetClass [

	^ GtkLabel
]

{ #category : 'accessing' }
GtkTBinTest >> newChildWidget [

	^ self childWidgetClass new
]

{ #category : 'tests' }
GtkTBinTest >> testChild [
	"A simple test to verify setting a child will not crash the environment"

	self widget child: self newChildWidget.
	self window child: self widget
]
