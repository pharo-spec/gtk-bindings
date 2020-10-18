Class {
	#name : #GtkTestResource,
	#superclass : #TestResource,
	#category : #'Gtk-Tests'
}

{ #category : #running }
GtkTestResource >> setUp [

	GtkApplication ensureRunning
]
