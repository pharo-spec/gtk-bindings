Class {
	#name : #GtkSignalListItemFactory,
	#superclass : #GtkListItemFactory,
	#category : #'Gtk4-List'
}

{ #category : #'as yet unclassified' }
GtkSignalListItemFactory class >> gtkNew [ 

	self ffiCall: #(GtkSignalListItemFactory *gtk_signal_list_item_factory_new())
]

{ #category : #'as yet unclassified' }
GtkSignalListItemFactory class >> new [

	^ self gtkNew initialize
]

{ #category : #signaling }
GtkSignalListItemFactory >> connectBind: aBlock [
	"aBlock receives one argument: a GtkListItem"

	(GBindCallback do: aBlock) connectTo: self
]

{ #category : #signaling }
GtkSignalListItemFactory >> connectSetup: aBlock [
	"aBlock receives one argument: a GtkListItem"

	(GSetupCallback do: aBlock) connectTo: self
]
