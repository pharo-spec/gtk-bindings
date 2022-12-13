"
The “key-release-event” signal

gboolean
user_function (GtkWidget *widget,
               GdkEvent  *event,
               gpointer   user_data)

The ::key-release-event signal is emitted when a key is released.
To receive this signal, the GdkWindow associated to the widget needs to enable the GDK_KEY_RELEASE_MASK mask.
This signal will be sent to the grab widget if there is one.


"
Class {
	#name : #GKeyReleaseEventCallback,
	#superclass : #GManagedSignalCallback,
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Callbacks'
}

{ #category : #accessing }
GKeyReleaseEventCallback class >> signalName [

	^ 'key-release-event'
]

{ #category : #accessing }
GKeyReleaseEventCallback >> do: aBlock [

	super do: [ :widget :event :aData |
		aBlock value: (GdkKeyEvent fromHandle: event) ]
]

{ #category : #accessing }
GKeyReleaseEventCallback >> signature [

	^ #(gboolean (void *widget, void* event, void *aData))
]
