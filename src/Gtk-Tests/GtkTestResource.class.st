Class {
	#name : #GtkTestResource,
	#superclass : #TestResource,
	#category : #'Gtk-Tests-ClassBuilder'
}

{ #category : #running }
GtkTestResource >> setUp [

	GtkApplication ensureRunning
]
