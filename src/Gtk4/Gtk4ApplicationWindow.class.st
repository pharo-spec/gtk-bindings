Class {
	#name : #Gtk4ApplicationWindow,
	#superclass : #Gtk4Window,
	#category : #Gtk4
}

{ #category : #'instance creation' }
Gtk4ApplicationWindow class >> gtkNew: application [

	^ self ffiCall: #(#Gtk4ApplicationWindow *gtk_application_window_new (GtkApplication *application))
]

{ #category : #'instance creation' }
Gtk4ApplicationWindow class >> newApplication: aGtkApplication [

	^ (self gtkNew: aGtkApplication) initialize
]
