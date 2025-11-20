"
https://docs.gtk.org/gtk4/class.CustomSorter.html
"
Class {
	#name : 'GtkCustomSorter',
	#superclass : 'GtkSorter',
	#instVars : [
		'sortFunction'
	],
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkCustomSorter class >> gtkNew [

	^ self ffiCall: #(GtkCustomSorter* gtk_custom_sorter_new (NULL, NULL, NULL))
]

{ #category : 'instance creation' }
GtkCustomSorter class >> new [

	^ self gtkNew initialize
]

{ #category : 'instance creation' }
GtkCustomSorter class >> newSorter: aBlock [

	^ self new
		sortFunction: aBlock;
		yourself
]

{ #category : 'private' }
GtkCustomSorter >> setSortFunc: sort_func [

	self ffiCall: #(void gtk_custom_sorter_set_sort_func (
		self,
  		"GCompareDataFunc"GCallback sort_func,
  		"gpointer user_data"NULL,
  		"GDestroyNotify user_destroy"NULL))
]

{ #category : 'sorting' }
GtkCustomSorter >> sortFunction: aBlock [

	sortFunction := GCallback 
		signature: #(gint (gpointer a, gpointer b, gpointer user_data))
		block: [ :a :b :user_data | aBlock value: a value: b ].
	
	self setSortFunc: sortFunction
]
