Class {
	#name : 'GtkCheckButtonTest',
	#superclass : 'GtkBaseButtonTest',
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'tests' }
GtkCheckButtonTest >> testCheckButtonAsRadioButton [

	| button1 button2 button3 |
	button1 := self newWidget.
	button2 := self newWidget.
	button3 := self newWidget.

	button2 group: button1.
	button3 group: button1.

	self window child: (GtkBox newVertical
		append: button1;
		append: button2;
		append: button3;
		yourself).

	button1 active: true.
	self deny: button2 isActive.
	self deny: button3 isActive.

	button2 active: true.
	self deny: button1 isActive.
	self deny: button3 isActive.

	button3 active: true.
	self deny: button1 isActive.
	self deny: button2 isActive
]

{ #category : 'accessing' }
GtkCheckButtonTest >> widgetClass [
	
	^ GtkCheckButton
]
