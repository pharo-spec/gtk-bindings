"
https://docs.gtk.org/gtk4/class.ListBase.html
"
Class {
	#name : 'GtkListBase',
	#superclass : 'GtkWidget',
	#instVars : [
		'factory',
		'selectionModel'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkListBase class >> gtkNew [

	^ self subclassResponsibility
]

{ #category : 'instance creation' }
GtkListBase class >> new [

	^ self gtkNew initialize
]

{ #category : 'signaling' }
GtkListBase >> connectRowActivated: aBlock [
	"aBlock receives one argument: position"

	(GRowActivatedCallback do: aBlock) connectTo: self
]

{ #category : 'accessing' }
GtkListBase >> enableRubberband: enable [

	self subclassResponsibility
]

{ #category : 'accessing' }
GtkListBase >> factory [

	^ factory ifNil: [ factory := self getFactory ]
]

{ #category : 'accessing' }
GtkListBase >> factory: aFactory [

	factory := aFactory.
	logger trace: factory.
	self setFactory: factory.
	factory objectUnrefNow
]

{ #category : 'private' }
GtkListBase >> getFactory [
	
	^ self subclassResponsibility
]

{ #category : 'private' }
GtkListBase >> getModel [

	self subclassResponsibility
]

{ #category : 'accessing' }
GtkListBase >> selectionModel [

	^ selectionModel ifNil: [ selectionModel := self getModel ]
]

{ #category : 'accessing' }
GtkListBase >> selectionModel: aModel [
	| oldSelectionModel |

	"I keep old selection model while I perform operations to prevent 
	 posible undesired finalisations (not sure this is going to work, 
	 but I realise sometimes while changing model it crashes because 
	 clear the model fails (in gtk side) :("
	oldSelectionModel := selectionModel.
	oldSelectionModel ifNotNil: [ oldSelectionModel objectRef ].
	selectionModel := aModel.
	self setModel: selectionModel.
	selectionModel objectUnrefNow.
	oldSelectionModel ifNotNil: [ oldSelectionModel objectUnref ]
]

{ #category : 'private' }
GtkListBase >> setFactory: aFactory [
	
	self subclassResponsibility
]

{ #category : 'private' }
GtkListBase >> setModel: aModel [

	self subclassResponsibility
]

{ #category : 'accessing' }
GtkListBase >> singleClickActivate: single_click_activate [

	self subclassResponsibility
]
