"
[https://developer.gnome.org/gtk3/stable/GtkShortcutsSection.html](https://developer.gnome.org/gtk3/stable/GtkShortcutsSection.html)
"
Class {
	#name : #GtkShortcutsSection,
	#superclass : #GtkShortcutsWidget,
	#category : #'Gtk-Shortcuts'
}

{ #category : #accessing }
GtkShortcutsSection class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_shortcuts_section_get_type())
]

{ #category : #private }
GtkShortcutsSection class >> widgetNew [
	"self ffiCall: #(GtkBox *gtk_box_new (GtkOrientation orientation, gint spacing))"

	^ self fromHandle: (GObject gObjectNew: self gType)
]
