Class {
	#name : #GPressedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk4-Event-Callbacks'
}

{ #category : #signalling }
GPressedCallback class >> signalName [

	^ 'pressed'
]

{ #category : #enumerating }
GPressedCallback >> do: aBlock [ 

	super do: [ :gesture :n_press :x :y :user_data |
		aBlock cull: x@y cull: n_press ]
]

{ #category : #accessing }
GPressedCallback >> signature [

	^ #(void (void *gesture, gint n_press, gdouble x, gdouble y, gpointer user_data))
]
