Class {
	#name : 'GtkApplicationWindow',
	#superclass : 'GtkWindow',
	#category : 'Gtk-Widget-Window',
	#package : 'Gtk',
	#tag : 'Widget-Window'
}

{ #category : 'private' }
GtkApplicationWindow class >> gtkNew: application [

	^ self ffiCall: #(#GtkApplicationWindow *gtk_application_window_new (#GtkApplication *application))
]

{ #category : 'instance creation' }
GtkApplicationWindow class >> newApplication: aGtkApplication [

	^ (self gtkNew: aGtkApplication) initialize
]
