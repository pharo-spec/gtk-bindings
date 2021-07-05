"
[https://developer.gnome.org/gtk3/stable/GtkShortcutsWindow.html](https://developer.gnome.org/gtk3/stable/GtkShortcutsWindow.html)
"
Class {
	#name : #GtkShortcutsWindow,
	#superclass : #GtkWindow,
	#category : #'Gtk-Shortcuts'
}

{ #category : #examples }
GtkShortcutsWindow class >> example [
	| data window |
	
	GtkEngine ensureRunning.

	window := self new 
		beModal;
		resize: 800@300;
		yourself.
		
	data := { 
		{ 
			'Section 1'. { 
				{ 
					'Group 1'. {
						{ 'Shortcut 1'. $a control }.
						{ 'Shortcut 2'. $b control shift }.
						{ 'Shortcut 3'. $c control alt shift } } }.
				{ 
					'Group 2'. {
						{ 'Shortcut 4'. $d alt }.
						{ 'Shortcut 4'. $e control }.
						{ 'Shortcut 5'. $f shift } } } } }.
		{ 
			'Section 2'. { 
				{ 
					'Group 2.1'. { 
						{ 'Shortcut 6'. (KeyboardKey F1) alt }.
						{ 'Shortcut 7'. Character cr asKeyCombination } } } } } }.

	data do: [ :eachSection | | section |
		section := GtkShortcutsSection new.
		section title: eachSection first.
		
		eachSection second do: [ :eachGroup | | group |
			group := GtkShortcutsGroup new.
			group title: eachGroup first.
			eachGroup second do: [ :eachShortcut | | shortcut |
				shortcut := GtkShortcutsShortcut 
					newTitle: eachShortcut first 
					shortcut: eachShortcut second.
				group add: shortcut  ].
			section add: group. ].		
		window add: section ].

	window showAll
]

{ #category : #accessing }
GtkShortcutsWindow class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_shortcuts_window_get_type())
]

{ #category : #'as yet unclassified' }
GtkShortcutsWindow class >> windowNew: type [ 

	^ (self fromHandle: (GObject 
			gObjectNew: self gType 
			propertyName: 'type' 
			integerValue: type value))
		yourself
]

{ #category : #accessing }
GtkShortcutsWindow >> beNotResizable [

	^ self resizable: false
]

{ #category : #accessing }
GtkShortcutsWindow >> beResizable [

	^ self resizable: true
]

{ #category : #testing }
GtkShortcutsWindow >> isResizable [

	^ self gObjectGetBoolean: 'resizable'
]

{ #category : #accessing }
GtkShortcutsWindow >> resizable: aBoolean [

	self gObjectSet: 'resizable' toBoolean: aBoolean
]
