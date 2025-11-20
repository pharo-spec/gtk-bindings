"
https://docs.gtk.org/gtk4/method.EntryBuffer.set_text.html
"
Class {
	#name : 'GtkEntryBuffer',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-Input',
	#package : 'Gtk',
	#tag : 'Widget-Input'
}

{ #category : 'accessing' }
GtkEntryBuffer >> text [

	^ self ffiCall: #(char *gtk_entry_buffer_get_text (self))
]

{ #category : 'accessing' }
GtkEntryBuffer >> text: chars [

	self ffiCall: #(void gtk_entry_buffer_set_text (self, const char* chars, int -1))
]
