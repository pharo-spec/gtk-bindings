Class {
	#name : 'GtkWidgetTest',
	#superclass : 'GtkBaseTest',
	#instVars : [
		'window',
		'widget'
	],
	#category : 'Gtk-Tests-Widget',
	#package : 'Gtk-Tests',
	#tag : 'Widget'
}

{ #category : 'testing' }
GtkWidgetTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkWidgetTest ]
]

{ #category : 'instance creation' }
GtkWidgetTest >> newWidget [

	^ self widgetClass new
]

{ #category : 'running' }
GtkWidgetTest >> setUp [

	super setUp.
	window := GtkWindow new.
	window present.
	widget := self newWidget	
]

{ #category : 'running' }
GtkWidgetTest >> tearDown [

	window ifNotNil: #close.
	super tearDown
]

{ #category : 'tests' }
GtkWidgetTest >> testMeasureHorizontal [
	| measure |

	self window child: self widget.
	measure := self widget measureHorizontal.
	self flag: #TODO. "I don't know how to test this, numbers are different :("
	"self assert: measure natural > 0.
	self assert: measure minimum > 0.
	self assert: measure naturalBaseline equals: -1.
	self assert: measure minimumBaseline equals: -1"
]

{ #category : 'tests' }
GtkWidgetTest >> testMeasureVertical [
	| measure |

	self window child: self widget.
	measure := self widget measureVertical.
	self flag: #TODO. "I don't know how to test this, numbers are different :("
	"self assert: measure natural equals: 0.
	self assert: measure minimum equals: 0.
	self assert: measure naturalBaseline equals: -1.
	self assert: measure minimumBaseline equals: -1"
]

{ #category : 'tests' }
GtkWidgetTest >> testSmoke [
	"a smoke test that tests the widget can be created and added into a window"
	
	self window child: self widget
]

{ #category : 'tests' }
GtkWidgetTest >> testVisible [

	self assert: self widget isVisible.
	self widget visible: false.
	self deny: self widget isVisible.
	self widget visible: true.
	self assert: self widget isVisible.
	
]

{ #category : 'accessing' }
GtkWidgetTest >> widget [

	^ widget
]

{ #category : 'accessing' }
GtkWidgetTest >> widgetClass [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
GtkWidgetTest >> window [

	^ window
]
