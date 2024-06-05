Class {
	#name : 'GtkTreeListRow',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'accessing' }
GtkTreeListRow >> item [ 

	^ self ffiCall: #(GObject* gtk_tree_list_row_get_item (self))
]
