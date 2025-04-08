"
https://docs.gtk.org/gtk4/class.FileFilter.html
"
Class {
	#name : 'GtkFileFilter',
	#superclass : 'GtkFilter',
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'private' }
GtkFileFilter class >> gtkNew [

	^ self ffiCall: #(GtkFileFilter* gtk_file_filter_new ())
]

{ #category : 'instance creation' }
GtkFileFilter class >> new [
	
	^ self gtkNew initialize
]

{ #category : 'accessing' }
GtkFileFilter >> addPattern: pattern [

	self ffiCall: #(void gtk_file_filter_add_pattern (self, const char* pattern))

]

{ #category : 'accessing' }
GtkFileFilter >> addSuffix: suffix [

	self ffiCall: #(void gtk_file_filter_add_suffix (self, const char* suffix))

]
