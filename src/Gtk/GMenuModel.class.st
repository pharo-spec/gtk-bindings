"
https://docs.gtk.org/gio/class.MenuModel.html
"
Class {
	#name : #GMenuModel,
	#superclass : #GObject,
	#category : #'Gtk-Widget-Menu'
}

{ #category : #testing }
GMenuModel >> numberOfItems [

	^ self ffiCall: #(gint g_menu_model_get_n_items (self))
]
