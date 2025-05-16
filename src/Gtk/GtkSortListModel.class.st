Class {
	#name : 'GtkSortListModel',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'model',
		'sorter'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkSortListModel class >> gtkNew [

	^ self ffiCall: #(GtkSortListModel* gtk_sort_list_model_new (NULL, NULL))
]

{ #category : 'accessing' }
GtkSortListModel >> model: aModel [

	model := aModel.
	self setModel: aModel.
	model objectUnrefNow
]

{ #category : 'private' }
GtkSortListModel >> setModel: aModel [

	self ffiCall: #(void gtk_sort_list_model_set_model (self, GListModel* aModel))
]

{ #category : 'private' }
GtkSortListModel >> setSorter: aSorter [

	self ffiCall: #(void gtk_sort_list_model_set_sorter (self, GtkSorter* aSorter))
]

{ #category : 'accessing' }
GtkSortListModel >> sorter: aSorter [

	sorter := aSorter.
	self setSorter: aSorter.
	aSorter objectUnrefNow
]
