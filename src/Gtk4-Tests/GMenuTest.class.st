Class {
	#name : #GMenuTest,
	#superclass : #GtkBaseTest,
	#category : #'Gtk4-Tests'
}

{ #category : #'instance creation' }
GMenuTest >> newMenu [

	^ GMenu new
]

{ #category : #tests }
GMenuTest >> testAppendLabelAction [

	self newMenu
		appendLabel: 'Test 1' action: 'action.test1';
		appendLabel: 'Test 2' action: 'action.test2'
]

{ #category : #tests }
GMenuTest >> testNew [

	self deny: self newMenu getHandle isNull
]
