"
[https://developer.gnome.org/gtk3/stable/GtkShortcutsGroup.html](https://developer.gnome.org/gtk3/stable/GtkShortcutsGroup.html)
"
Class {
	#name : #GtkShortcutsGroup,
	#superclass : #GtkShortcutsWidget,
	#category : #'Gtk-Shortcuts'
}

{ #category : #accessing }
GtkShortcutsGroup class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_shortcuts_group_get_type())
]

{ #category : #private }
GtkShortcutsGroup class >> widgetNew [
	"self ffiCall: #(GtkBox *gtk_box_new (GtkOrientation orientation, gint spacing))"

	^ self fromHandle: (GObject gObjectNew: self gType)
]
