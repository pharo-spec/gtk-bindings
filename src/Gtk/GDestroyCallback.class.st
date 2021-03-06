"
The “destroy” signal

void
user_function (GtkWidget *object,
               gpointer   user_data)

Signals that all holders of a reference to the widget should release the reference that they hold. May result in finalization of the widget if all references are released.
This signal is not suitable for saving widget state.
"
Class {
	#name : #GDestroyCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Callbacks'
}

{ #category : #accessing }
GDestroyCallback class >> signalName [

	^ 'destroy'
]
