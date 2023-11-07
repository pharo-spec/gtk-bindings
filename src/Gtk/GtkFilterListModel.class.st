"
https://docs.gtk.org/gtk4/class.FilterListModel.html
"
Class {
	#name : 'GtkFilterListModel',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'model',
		'filter'
	],
	#category : 'Gtk-Widget-Input',
	#package : 'Gtk',
	#tag : 'Widget-Input'
}

{ #category : 'private' }
GtkFilterListModel class >> gtkNew [

	^ self ffiCall: #(GtkFilterListModel *gtk_filter_list_model_new (
		"GListModel* model"NULL, 
		"GtkFilter* filter"NULL))
]

{ #category : 'instance creation' }
GtkFilterListModel class >> new [

	^ self gtkNew initialize
]

{ #category : 'accessing' }
GtkFilterListModel >> filter: aFilter [

	filter := aFilter.
	self setFilter: filter.
	filter doNotAutoRelease.
	filter objectUnref
]

{ #category : 'accessing' }
GtkFilterListModel >> model: aModel [

	model := aModel.
	self setModel: model.
	model doNotAutoRelease.
	model objectUnref
]

{ #category : 'private' }
GtkFilterListModel >> setFilter: aFilter [

	self ffiCall: #(void gtk_filter_list_model_set_filter (self, GtkFilter* aFilter))
]

{ #category : 'private' }
GtkFilterListModel >> setModel: aModel [

	self ffiCall: #(void gtk_filter_list_model_set_model (self, GListModel* model))
]
