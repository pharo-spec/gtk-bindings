Class {
	#name : 'GtkStringSorter',
	#superclass : 'GtkSorter',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkStringSorter class >> gtkNew [

	^ self ffiCall: #(GtkStringSorter* gtk_string_sorter_new (NULL))
]

{ #category : 'instance creation' }
GtkStringSorter class >> new [

	^ self gtkNew initialize
]
