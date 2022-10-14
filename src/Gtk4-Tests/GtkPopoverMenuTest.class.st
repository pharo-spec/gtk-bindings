Class {
	#name : #GtkPopoverMenuTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk4-Tests-Widget'
}

{ #category : #tests }
GtkPopoverMenuTest >> testPresent [

	self widget present
]

{ #category : #tests }
GtkPopoverMenuTest >> testPresentWithMenuModel [

	self widget 
		menuModel: (GMenu new 
			appendLabel: 'Test 1' action: 'action.test1';
			appendLabel: 'Test 2' action: 'action.test2';
			yourself);
		present
]

{ #category : #accessing }
GtkPopoverMenuTest >> widgetClass [

	^ GtkPopoverMenu
]
