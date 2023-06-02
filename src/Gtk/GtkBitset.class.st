"
https://docs.gtk.org/gtk4/struct.Bitset.html
"
Class {
	#name : #GtkBitset,
	#superclass : #GBaseObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : #'Gtk-Widget-ListView'
}

{ #category : #enumerating }
GtkBitset >> iterator [
	
	^ GtkBitsetIter on: self
]

{ #category : #accessing }
GtkBitset >> unref [

	self ffiCall: #(void gtk_bitset_unref (self))
]
