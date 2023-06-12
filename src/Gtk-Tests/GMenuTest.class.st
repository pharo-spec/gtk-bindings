Class {
	#name : #GMenuTest,
	#superclass : #GtkBaseTest,
	#instVars : [
		'menu'
	],
	#category : #'Gtk-Tests-Base'
}

{ #category : #'instance creation' }
GMenuTest >> newMenu [

	^ GMenu new
]

{ #category : #initialization }
GMenuTest >> setUp [

	super setUp.
	menu := self newMenu
]

{ #category : #tests }
GMenuTest >> testAppendItem [

	menu
		appendItem: (GMenuItem newLabel: 'Test1' action: 'action.test1');
		appendItem: (GMenuItem newLabel: 'Test2' action: 'action.test2').
		
	self assert: menu numberOfItems equals: 2
]

{ #category : #tests }
GMenuTest >> testAppendLabelAction [
	
	menu
		appendLabel: 'Test 1' actionName: 'action.test1';
		appendLabel: 'Test 2' actionName: 'action.test2'.
		
	self assert: menu numberOfItems equals: 2
]
