"
https://docs.gtk.org/gtk4/class.MultiSelection.html
"
Class {
	#name : 'GtkMultiSelection',
	#superclass : 'GtkSelectionModel',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkMultiSelection class >> gtkNew [

	self ffiCall: #(GtkMultiSelection* gtk_multi_selection_new (NULL))
]

{ #category : 'private' }
GtkMultiSelection >> getModel [

	self ffiCall: #(GListModel* gtk_multi_selection_get_model (self))
]

{ #category : 'private' }
GtkMultiSelection >> setModel: aModel [

	self ffiCall: #(void gtk_multi_selection_set_model (self, GListModel* aModel))
]
