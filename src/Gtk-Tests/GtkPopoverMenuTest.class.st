Class {
	#name : #GtkPopoverMenuTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk-Tests-Widget'
}

{ #category : #tests }
GtkPopoverMenuTest >> testMenuModel [
	| box actionGroup model |
	
	
	"popover needs to have a container as parent to be correctly shown"
	box := GtkBox newVertical.
	self widget parent: box.

	"also actions needs to be included in parent container so the popover 
	 can take them."	
	actionGroup := GSimpleActionGroup new.
	actionGroup insert: ((GSimpleAction newName: 'test1')
		connectActivate: [ 'TEST1' crTrace ];
		yourself).
	box insertActionGroup: 'action' actions: actionGroup.	

	model := GMenu new 
		appendLabel: 'Test 1' actionName: 'action.test1';
		appendLabel: 'Test 2' actionName: 'action.test2';
		yourself.
	self widget menuModel: model.
	
	self window child: box.
	
	self widget popup
]

{ #category : #tests }
GtkPopoverMenuTest >> testPopup [
	| box |
	
	"popover needs to have a container as parent to be correctly shown"
	box := GtkBox newVertical.
	self widget parent: box.
	self window child: box.
	
	self widget popup
]

{ #category : #tests }
GtkPopoverMenuTest >> testPresent [

	self widget present
]

{ #category : #tests }
GtkPopoverMenuTest >> testPresentWithMenuModel [

	self widget 
		menuModel: (GMenu new 
			appendLabel: 'Test 1' actionName: 'action.test1';
			appendLabel: 'Test 2' actionName: 'action.test2';
			yourself);
		present
]

{ #category : #accessing }
GtkPopoverMenuTest >> widgetClass [

	^ GtkPopoverMenu
]
