"
https://docs.gtk.org/gtk4/method.EntryBuffer.set_text.html
"
Class {
	#name : #GtkEntryBuffer,
	#superclass : #GObject,
	#category : #'Gtk-Widget-Input'
}

{ #category : #accessing }
GtkEntryBuffer >> text [

	^ self ffiCall: #(const char* gtk_entry_buffer_get_text (self))
]

{ #category : #accessing }
GtkEntryBuffer >> text: chars [

	self ffiCall: #(void gtk_entry_buffer_set_text (self, const char* chars, int -1))
]