"
https://docs.gtk.org/gtk4/class.ListHeader.html
"
Class {
	#name : 'GtkListHeader',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'accessing' }
GtkListHeader >> child [

	^ self ffiCall: #("GtkWidget *"void *gtk_list_header_get_child (self))
]

{ #category : 'accessing' }
GtkListHeader >> child: child [

	self ffiCall: #(void gtk_list_header_set_child (self, GtkWidget* child))
]

{ #category : 'accessing' }
GtkListHeader >> end [

	^ self ffiCall: #(guint gtk_list_header_get_end (self))
]

{ #category : 'accessing' }
GtkListHeader >> item [

	^ self ffiCall: #("GObject *"void *gtk_list_header_get_item (self))
]

{ #category : 'accessing' }
GtkListHeader >> numberOfItems [

	^ self ffiCall: #(guint gtk_list_header_get_n_items (self))
]

{ #category : 'accessing' }
GtkListHeader >> start [

	^ self ffiCall: #(guint gtk_list_header_get_start (self))
]
