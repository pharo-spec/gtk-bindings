"
GtkTreeSortable
GtkTreeSortable — The interface for sortable models used by GtkTreeView

https://developer.gnome.org/gtk3/stable/GtkTreeSortable.html
"
Trait {
	#name : #GtkTTreeSortable,
	#instVars : [
		'functionsByColumn'
	],
	#category : #'Gtk-Widget-Tree'
}

{ #category : #private }
GtkTTreeSortable >> compare: aBlock store: model a: a b: b [
	| store |
				
	store := GtkTreeStore fromHandle: model.
	^ aBlock 
		value: ((GtkTreeIter fromHandle: a)
			store: store;
			yourself)
		value: ((GtkTreeIter fromHandle: b)
			store: store;
			yourself)
]

{ #category : #signaling }
GtkTTreeSortable >> connectSortColumnChanged: aBlock [

	self connect: 'sort-column-changed' do: aBlock
]

{ #category : #initialization }
GtkTTreeSortable >> initializeTTreeSortable [

	functionsByColumn := SmallDictionary new
]

{ #category : #private }
GtkTTreeSortable >> setSortFunc: sort_func columnId: sort_column_id [

	self ffiCall: #(void gtk_tree_sortable_set_sort_func (
		self,
		gint sort_column_id,
		GCallback sort_func,
		NULL,
		NULL))
]

{ #category : #sorting }
GtkTTreeSortable >> sortBy: aBlock columnId: id [

	self 
		sortFunc: (GCallback 
			signature: #(gint (void *model, void *a, void *b, gpointer user_data))
			block: [ :model :a :b :user_data | 
				self 
					compare: aBlock 
					store: model 
					a: a
					b: b ])
		columnId: id
]

{ #category : #sorting }
GtkTTreeSortable >> sortColumnId: sort_column_id orderType: order [

	^ self ffiCall: #(void gtk_tree_sortable_set_sort_column_id (
		self,
		gint sort_column_id, 
		"GtkSortType"gint order))
]

{ #category : #private }
GtkTTreeSortable >> sortFunc: aFunction columnId: id [

	functionsByColumn at: id put: aFunction.
	self setSortFunc: aFunction columnId: id
]
