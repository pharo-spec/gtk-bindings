"
I'm the foundation of a system dialog. 
System dialogs are the ones that are in the hierachy of GtkDialog: 

https://developer.gnome.org/gtk3/stable/GtkDialog.html#GtkDialog.object-hierarchy
"
Class {
	#name : 'GtkSystemDialog',
	#superclass : 'GtkBaseDialog',
	#pools : [
		'GtkFileChooserAction',
		'GtkResponseType'
	],
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'running' }
GtkSystemDialog >> run [
	"IMPORTANT Execute this outside the runloop!"
	| sem |
	
	sem := Semaphore new.
	GRunLoop defer: [ 
		self beHideOnClose.
		self connectHide: [ sem signal ].
		self present ].
	sem wait.
]
