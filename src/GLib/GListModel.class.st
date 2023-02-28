"
https://docs.gtk.org/gio/iface.ListModel.html

THIS IS A CONCRETE IMPLEMENTATION OF THE INTERFACE.
Some gtk4 functions answer a GListModel instance (hidding its concrete type).
This class is useful to access those results.
The real interface is defined in `GListModelIface`.
Concrete types are defined in `GListStore` hierarchy.
"
Class {
	#name : #GListModel,
	#superclass : #GObject,
	#traits : 'GdkTLibrary + GTListModel',
	#classTraits : 'GdkTLibrary classTrait + GTListModel classTrait',
	#category : #'GLib-Lists'
}

{ #category : #'instance creation' }
GListModel class >> new [

	self error: 'This is an abstract type, it will be provided by some functions. Use GListStore hierarchy instead.'
]
