Class {
	#name : #GtkWidgetTest,
	#superclass : #GtkBaseTest,
	#instVars : [
		'window',
		'widget'
	],
	#category : #'Gtk4-Tests'
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
GtkWidgetTest >> runCase [

	GEngine ensureRunning.
	self runApplicationWith: [ super runCase ]
]

{ #category : #running }
GtkWidgetTest >> setUp [

	super setUp.
	window := Gtk4Window new.
	window present.
	widget := self newWidget	
]

{ #category : #running }
GtkWidgetTest >> tearDown [

	window ifNotNil: #close.
	super tearDown
]

{ #category : #tests }
GtkWidgetTest >> testSmoke [
	"a smoke test that tests the widget can be created and added into a window"
	
	window child: widget
]

{ #category : #accessing }
GtkWidgetTest >> widget [

	^ widget ifNil: [ widget := GRunLoop defer: [ self widgetClass new ] ]
]

{ #category : #accessing }
GtkWidgetTest >> widgetClass [

	^ self subclassResponsibility
]
