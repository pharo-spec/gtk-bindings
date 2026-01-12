"
https://docs.gtk.org/gtk4/class.DragSource.html
"
Class {
	#name : 'GtkDragSource',
	#superclass : 'GtkGestureSingle',
	#category : 'Gtk-Event-Controllers',
	#package : 'Gtk',
	#tag : 'Event-Controllers'
}

{ #category : 'signaling' }
GtkDragSource >> connectDragBegin: aBlock [ 

	self 
		connect: 'drag-begin' 
		signature: #(void (void *selfHandle, "GdkDrag *"void *drag, gpointer user_data)) 
		do: [ :selfHandle :drag :user_data | 
			aBlock value: drag ]
]

{ #category : 'signaling' }
GtkDragSource >> connectDragCancel: aBlock [ 

	self 
		connect: 'drag-end' 
		signature: #(void (void *selfHandle, "GdkDrag *"void *drag, "GdkDragCancelReason*"void *reason, gpointer user_data)) 
		do: [ :selfHandle :drag :delete_data :user_data | 
			aBlock value: drag value: delete_data ]
]

{ #category : 'signaling' }
GtkDragSource >> connectDragEnd: aBlock [ 

	self 
		connect: 'drag-end' 
		signature: #(void (void *selfHandle, "GdkDrag *"void *drag, gboolean delete_data, gpointer user_data)) 
		do: [ :selfHandle :drag :delete_data :user_data | 
			aBlock value: drag value: delete_data ]
]

{ #category : 'signaling' }
GtkDragSource >> connectPrepare: aBlock [ 

	self 
		connect: 'prepare'
		signature: #("GdkContentProvider *"void *(void *selfHandle, gdouble x, gdouble y, gpointer user_data))
		do: [ :selfHandle :x :y :user_data | aBlock value: x@y ]
]
