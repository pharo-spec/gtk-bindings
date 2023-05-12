Class {
	#name : #GtkFixedTest,
	#superclass : #GtkWidgetTest,
	#traits : 'GtkTContainerTest',
	#classTraits : 'GtkTContainerTest classTrait',
	#category : #'Gtk-Tests-Widget'
}

{ #category : #tests }
GtkFixedTest >> testMoveChildTo [
	| child |

	self widget 
		putChild: (child := self newChildWidget) 
		at: 1@1.
		
	self widget moveChild: child to: 10@10
]

{ #category : #tests }
GtkFixedTest >> testPutChidtAt [

	self widget 
		putChild: self newChildWidget 
		at: 1@1.
	self assert: self widget children size equals: 1
]

{ #category : #tests }
GtkFixedTest >> testRemove [
	| child |

	self widget 
		putChild: (child := self newChildWidget) 
		at: 1@1.
		
	self widget remove: child.
	
	self deny: self widget hasChildren
]

{ #category : #accessing }
GtkFixedTest >> widgetClass [

	^ GtkFixed
]
