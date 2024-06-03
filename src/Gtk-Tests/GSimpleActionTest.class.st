Class {
	#name : 'GSimpleActionTest',
	#superclass : 'GtkBaseTest',
	#category : 'Gtk-Tests-Base',
	#package : 'Gtk-Tests',
	#tag : 'Base'
}

{ #category : 'tests' }
GSimpleActionTest >> testEnable [

	| action |
	
	action := GSimpleAction newName: 'Test'.
	self assert: action isEnabled.
	action enable: false.
	self deny: action isEnabled	
]

{ #category : 'tests' }
GSimpleActionTest >> testNewName [
	| action |
	
	action := GSimpleAction newName: 'Test'.
	self assert: action name equals: 'Test'
	
]
