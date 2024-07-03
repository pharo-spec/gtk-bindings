Class {
	#name : 'GtkStandardDialog',
	#superclass : 'GObject',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'initialization' }
GtkStandardDialog >> initialize [

	super initialize.
	self engine registerWindow: self.
	self notifyDisposed: [ 
		self engine unregisterWindow: self ]
]
