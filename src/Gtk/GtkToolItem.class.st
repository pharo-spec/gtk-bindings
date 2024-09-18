"
GtkToolItem — The base class of widgets that can be added to GtkToolShell

https://developer.gnome.org/gtk3/stable/GtkToolItem.html
"
Class {
	#name : 'GtkToolItem',
	#superclass : 'GtkWidget',
	#category : 'Gtk-Widget-Toolbar',
	#package : 'Gtk',
	#tag : 'Widget-Toolbar'
}

{ #category : 'accessing' }
GtkToolItem class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_tool_item_get_type())
]

{ #category : 'testing' }
GtkToolItem class >> isDeprecated [

	"apparently, we need to use a GtkBox with a style `toolbar`"
	^ true
]

{ #category : 'instance creation' }
GtkToolItem class >> new [
	^ self toolItemNew initialize
]

{ #category : 'private' }
GtkToolItem class >> toolItemNew [
	^ self ffiCall: #(GtkToolItem *gtk_tool_item_new (void))
]

{ #category : 'accessing' }
GtkToolItem >> tooltipText: text [

	^ self ffiCall: #(void gtk_tool_item_set_tooltip_text (self, const gchar *text))
]
