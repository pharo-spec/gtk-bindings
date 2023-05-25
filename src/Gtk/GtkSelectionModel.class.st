"
https://docs.gtk.org/gtk4/iface.SelectionModel.html
"
Class {
	#name : #GtkSelectionModel,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : #'Gtk-Widget-ListView'
}

{ #category : #accessing }
GtkSelectionModel >> unselectAll [

	self ffiCall: #(gboolean gtk_selection_model_unselect_all (self))



]
