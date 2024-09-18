"
https://docs.gtk.org/gtk4/class.ListItem.html
"
Class {
	#name : 'GtkListItem',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'accessing' }
GtkListItem >> child [

	^ self ffiCall: #("GtkWidget *"void *gtk_list_item_get_child (self))
]

{ #category : 'accessing' }
GtkListItem >> child: child [

	self ffiCall: #(void gtk_list_item_set_child (self, GtkWidget* child))
]

{ #category : 'accessing' }
GtkListItem >> item [

	^ self ffiCall: #(GObject* gtk_list_item_get_item (self))
]

{ #category : 'accessing' }
GtkListItem >> position [

	^ self ffiCall: #(guint gtk_list_item_get_position (self))
]
