"
The “hide” signal

void
user_function (GtkWidget *widget,
               gpointer   user_data)

The ::hide signal is emitted when widget is hidden, for example with gtk_widget_hide().

"
Class {
	#name : 'GHideCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'accessing' }
GHideCallback class >> signalName [

	^ 'hide'
]
