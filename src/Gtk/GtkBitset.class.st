"
https://docs.gtk.org/gtk4/struct.Bitset.html
"
Class {
	#name : 'GtkBitset',
	#superclass : 'GBaseObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-ListView',
	#package : 'Gtk',
	#tag : 'Widget-ListView'
}

{ #category : 'private' }
GtkBitset class >> gtkNewEmpty [

	^ self ffiCall: #(GtkBitset* gtk_bitset_new_empty ())
]

{ #category : 'instance creation' }
GtkBitset class >> newEmpty [

	^ self gtkNewEmpty initialize
]

{ #category : 'accessing' }
GtkBitset >> add: value [

	self ffiCall: #(gboolean gtk_bitset_add (self, guint value))
]

{ #category : 'enumerating' }
GtkBitset >> iterator [
	
	^ GtkBitsetIter on: self
]

{ #category : 'accessing' }
GtkBitset >> unref [

	self ffiCall: #(void gtk_bitset_unref (self))
]
