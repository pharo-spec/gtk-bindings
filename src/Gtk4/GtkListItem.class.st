Class {
	#name : #GtkListItem,
	#superclass : #GObject,
	#category : #'Gtk4-List'
}

{ #category : #accessing }
GtkListItem >> child [

	^ self ffiCall: #("GtkWidget *"void *gtk_list_item_get_child (self))
]

{ #category : #accessing }
GtkListItem >> child: child [

	self ffiCall: #(void gtk_list_item_set_child (self, GtkWidget* child))
]

{ #category : #accessing }
GtkListItem >> item [

	^ self ffiCall: #("GObject *"void *gtk_list_item_get_item (self))
]

{ #category : #accessing }
GtkListItem >> position [

	^ self ffiCall: #(guint gtk_list_item_get_position (self))
]
