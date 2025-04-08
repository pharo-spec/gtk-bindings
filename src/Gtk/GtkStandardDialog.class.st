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

{ #category : 'private' }
GtkStandardDialog >> newCallback: aBlock [
"GAsyncReadyCallback
	void
(* GAsyncReadyCallback) (
  GObject* source_object,
  GAsyncResult* res,
  gpointer data
)"

	^ GCallback 
		signature: #(void (void *source, void *result, gpointer user_data)) 
		block: aBlock
]
