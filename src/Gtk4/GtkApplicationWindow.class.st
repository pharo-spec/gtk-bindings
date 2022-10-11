Class {
	#name : #GtkApplicationWindow,
	#superclass : #Gtk4Window,
	#category : #Gtk4
}

{ #category : #'instance creation' }
GtkApplicationWindow class >> gtkNew: application [

	^ self ffiCall: #(#GtkApplicationWindow *gtk_application_window_new (#GtkApplication *application))
]

{ #category : #'instance creation' }
GtkApplicationWindow class >> newApplication: aGtkApplication [

	^ (self gtkNew: aGtkApplication) initialize
]