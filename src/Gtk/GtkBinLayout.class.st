Class {
	#name : 'GtkBinLayout',
	#superclass : 'GtkLayoutManager',
	#category : 'Gtk-Layout',
	#package : 'Gtk',
	#tag : 'Layout'
}

{ #category : 'private' }
GtkBinLayout class >> gtkNew [

	^ self ffiCall: #(GtkBinLayout* gtk_bin_layout_new (void))
]

{ #category : 'instance creation' }
GtkBinLayout class >> new [

	^ self gtkNew initialize
]
