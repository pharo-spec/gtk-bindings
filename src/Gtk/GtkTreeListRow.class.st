"
https://docs.gtk.org/gtk4/class.TreeListRow.html
"
Class {
	#name : 'GtkTreeListRow',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkTreeListRow >> basicPosition [

	^ self ffiCall: #(guint gtk_tree_list_row_get_position(self))
]

{ #category : 'accessing' }
GtkTreeListRow >> childRowAt: position [

	^ self ffiCall: #(GtkTreeListRow *gtk_tree_list_row_get_child_row (
		self,
		guint position))
]

{ #category : 'accessing' }
GtkTreeListRow >> expand: expanded [

	self ffiCall: #(void gtk_tree_list_row_set_expanded (self, gboolean expanded))
]

{ #category : 'testing' }
GtkTreeListRow >> isExpandable [

	^ self ffiCall: #(gboolean gtk_tree_list_row_is_expandable (self))
]

{ #category : 'testing' }
GtkTreeListRow >> isExpanded [

	^ self ffiCall: #(gboolean gtk_tree_list_row_get_expanded (self))
]

{ #category : 'accessing' }
GtkTreeListRow >> item [ 
	"Important: 
	 The caller of the method takes ownership of the returned data, and is responsible for freeing it.
	 better to use #withItemDo: when possible. Otherwise do not forget to call #objectUnref when 
	 finish using it."

	^ self ffiCall: #(GObject* gtk_tree_list_row_get_item (self))
]

{ #category : 'accessing' }
GtkTreeListRow >> position [

	^ self basicPosition + 1
]

{ #category : 'accessing' }
GtkTreeListRow >> withItemDo: aBlock [
	| item |
	
	item := self item.
	^ [ aBlock value: item ]
	ensure: [ item objectUnref ]
]

{ #category : 'accessing' }
GtkTreeListRow >> withRowAt: aPosition do: aBlock [ 
	"this method is provided to be polymorphic with GtkTreeListModel"
	
	^ aBlock value: (self childRowAt: aPosition)
]
