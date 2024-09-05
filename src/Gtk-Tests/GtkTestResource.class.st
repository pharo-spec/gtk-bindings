Class {
	#name : 'GtkTestResource',
	#superclass : 'TestResource',
	#category : 'Gtk-Tests-ClassBuilder',
	#package : 'Gtk-Tests',
	#tag : 'ClassBuilder'
}

{ #category : 'running' }
GtkTestResource >> setUp [

	GtkApplication ensureRunning
]
