Class {
	#name : 'GtkDragSource',
	#superclass : 'GtkGestureSingle',
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'signaling' }
GtkDragSource >> connectPrepare: aBlock [ 

	self 
		connect: 'prepare'
		signature: #("GdkContentProvider *"void *(void *selfHandle, gdouble x, gdouble y, gpointer user_data))
		do: [ :selfHandle :x :y :user_data | aBlock value: x@y ]
]
