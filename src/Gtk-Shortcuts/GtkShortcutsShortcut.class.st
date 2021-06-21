"
[https://developer.gnome.org/gtk3/stable/GtkShortcutsShortcut.html](https://developer.gnome.org/gtk3/stable/GtkShortcutsShortcut.html)
"
Class {
	#name : #GtkShortcutsShortcut,
	#superclass : #GtkShortcutsWidget,
	#category : #'Gtk-Shortcuts'
}

{ #category : #accessing }
GtkShortcutsShortcut class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_shortcuts_shortcut_get_type())
]

{ #category : #'instance creation' }
GtkShortcutsShortcut class >> newTitle: aString accelerator: accelString [

	^ self new 
		title: aString;
		accelerator: accelString;
		yourself
]

{ #category : #'instance creation' }
GtkShortcutsShortcut class >> newTitle: aString shortcut: aShortcut [

	^ self new 
		title: aString;
		accelerator: (GtkShortcutsShortcutPrinter toString: aShortcut);
		yourself
]

{ #category : #private }
GtkShortcutsShortcut class >> widgetNew [
	"self ffiCall: #(GtkBox *gtk_box_new (GtkOrientation orientation, gint spacing))"

	^ self fromHandle: (GObject gObjectNew: self gType)
]

{ #category : #accessing }
GtkShortcutsShortcut >> accelerator [

	^ self gObjectGetString: 'accelerator' 
]

{ #category : #accessing }
GtkShortcutsShortcut >> accelerator: aString [

	self gObjectSet: 'accelerator' toString: aString
]
