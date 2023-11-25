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
	self setFactory: factory.
	factory doNotAutoRelease.
	factory objectUnref
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

	selectionModel := aModel.
	self setModel: selectionModel.
	selectionModel doNotAutoRelease.
	selectionModel objectUnref
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
