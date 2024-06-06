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
	"Important: 
	 The caller of the method takes ownership of the returned data, and is responsible for freeing it.
	 better to use #withItemDo: when possible. Otherwise do not forget to call #objectUnref when 
	 finish using it."

	^ self ffiCall: #(GObject* gtk_tree_list_row_get_item (self))
]

{ #category : 'accessing' }
GtkTreeListRow >> withItemDo: aBlock [
	| item |
	
	item := self item.
	^ [ aBlock value: item ]
	ensure: [ item objectUnref ]
]
