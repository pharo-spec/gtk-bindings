Class {
	#name : #GtkBaseButtonTest,
	#superclass : #GtkWidgetTest,
	#category : #'Gtk-Tests-Widget'
}

{ #category : #testing }
GtkBaseButtonTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkBaseButtonTest ]
]

{ #category : #tests }
GtkBaseButtonTest >> testChild [
	| child |

	child := GtkLabel newLabel: 'Test'.
	widget child: child.
	self assert: widget child getHandle equals: child getHandle
]

{ #category : #tests }
GtkBaseButtonTest >> testLabel [

	widget label: 'Test'.
	self assert: widget label equals: 'Test'
]
