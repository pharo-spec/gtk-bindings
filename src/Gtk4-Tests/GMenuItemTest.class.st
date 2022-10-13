Class {
	#name : #GMenuItemTest,
	#superclass : #GtkBaseTest,
	#category : #'Gtk4-Tests'
}

{ #category : #tests }
GMenuItemTest >> testNew [

	self deny: GMenuItem new getHandle isNull
]

{ #category : #tests }
GMenuItemTest >> testNewLabel [

	self deny: (GMenuItem newLabel: 'Test') getHandle isNull
]

{ #category : #tests }
GMenuItemTest >> testNewLabelAction [

	self deny: (GMenuItem newLabel: 'Test' action: 'test.action') getHandle isNull
]
