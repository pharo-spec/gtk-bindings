"
A base component for shortcut widgets 
"
Class {
	#name : #GtkShortcutsWidget,
	#superclass : #GtkContainer,
	#category : #'Gtk-Shortcuts'
}

{ #category : #accessing }
GtkShortcutsWidget class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_shortcuts_group_get_type())
]

{ #category : #'instance creation' }
GtkShortcutsWidget class >> new [

	^ self widgetNew initialize
]

{ #category : #'instance creation' }
GtkShortcutsWidget class >> newTitle: aString [ 

	^ self new 
		title: aString;
		yourself
]

{ #category : #private }
GtkShortcutsWidget class >> widgetNew [

	^ self subclassResponsibility
]

{ #category : #initialization }
GtkShortcutsWidget >> initialize [

	super initialize.
	self visible: true
]

{ #category : #accessing }
GtkShortcutsWidget >> title [

	^ self gObjectGetString: 'title'
]

{ #category : #accessing }
GtkShortcutsWidget >> title: aString [

	self gObjectSet: 'title' toString: aString
]

{ #category : #accessing }
GtkShortcutsWidget >> visible: aBoolean [

	self gObjectSet: 'visible' toBoolean: aBoolean
]
