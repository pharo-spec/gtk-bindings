Class {
	#name : #GtkWidgetTest,
	#superclass : #GtkBaseTest,
	#instVars : [
		'window',
		'widget'
	],
	#category : #'Gtk-Tests-Widget'
}

{ #category : #testing }
GtkWidgetTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkWidgetTest ]
]

{ #category : #'instance creation' }
GtkWidgetTest >> newWidget [

	^ self widgetClass new
]

{ #category : #running }
GtkWidgetTest >> setUp [

	super setUp.
	window := GtkWindow new.
	window present.
	widget := self newWidget	
]

{ #category : #running }
GtkWidgetTest >> tearDown [

	window ifNotNil: #close.
	super tearDown
]

{ #category : #tests }
GtkWidgetTest >> testMeasureHorizontal [
	| measure |

	self window child: self widget.
	measure := self widget measureHorizontal.
	self assert: measure natural > 0.
	self assert: measure minimum > 0.
	self assert: measure naturalBaseline > 0.
	self assert: measure minimumBaseline > 0
]

{ #category : #tests }
GtkWidgetTest >> testMeasureVertical [
	| measure |

	self window child: self widget.
	measure := self widget measureVertical.
	self assert: measure natural > 0.
	self assert: measure minimum > 0.
	self assert: measure naturalBaseline > 0.
	self assert: measure minimumBaseline > 0
]

{ #category : #tests }
GtkWidgetTest >> testSmoke [
	"a smoke test that tests the widget can be created and added into a window"
	
	self window child: self widget
]

{ #category : #accessing }
GtkWidgetTest >> widget [

	^ widget
]

{ #category : #accessing }
GtkWidgetTest >> widgetClass [

	^ self subclassResponsibility
]

{ #category : #accessing }
GtkWidgetTest >> window [

	^ window
]
