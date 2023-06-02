"
https://docs.gtk.org/gtk4/class.SignalListItemFactory.html
"
Class {
	#name : #GtkSignalListItemFactory,
	#superclass : #GtkListItemFactory,
	#category : #'Gtk-Widget-ListView'
}

{ #category : #private }
GtkSignalListItemFactory class >> gtkNew [ 

	self ffiCall: #(GtkSignalListItemFactory *gtk_signal_list_item_factory_new())
]

{ #category : #'instance creation' }
GtkSignalListItemFactory class >> new [

	^ self gtkNew initialize
]

{ #category : #signaling }
GtkSignalListItemFactory >> connectBind: aBlock [
	"aBlock receives one argument: a GtkListItem"

	(GBindCallback do: aBlock) 
		itemClass: self itemClass;
		connectTo: self
]

{ #category : #signaling }
GtkSignalListItemFactory >> connectSetup: aBlock [
	"aBlock receives one argument: a GtkListItem"

	(GSetupCallback do: aBlock) 
		itemClass: self itemClass;
		connectTo: self
]

{ #category : #private }
GtkSignalListItemFactory >> itemClass [

	^ GtkListItem
]
