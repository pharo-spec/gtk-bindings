Class {
	#name : 'GtkPopoverMenuBarTest',
	#superclass : 'GtkWidgetTest',
	#traits : 'GtkTContainerTest',
	#classTraits : 'GtkTContainerTest classTrait',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'tests' }
GtkPopoverMenuBarTest >> testMenuModel [
	| menuModel |

	menuModel := GMenu new
		appendItem: (GMenuItem newLabel: 'Test');
		appendLabel: 'Test2' submenu: (GMenu new 
			appendItem: (GMenuItem newLabel: 'Test3');
			yourself);
		yourself.
		
	widget menuModel: menuModel
]

{ #category : 'accessing' }
GtkPopoverMenuBarTest >> widgetClass [

	^ GtkPopoverMenuBar
]
