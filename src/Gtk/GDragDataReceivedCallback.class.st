Class {
	#name : 'GDragDataReceivedCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'signalling' }
GDragDataReceivedCallback class >> signalName [

	^ 'drag-data-received'
]

{ #category : 'accessing' }
GDragDataReceivedCallback >> signature [

	^ #(void ("GtkWidget *"void *widget,	
		 		 "GdkDragContext   *"void *context,
		 		 int x, 
				 int y,
				 "GtkSelectionData *"void *data,
				 guint info,
				 guint time,
				 gpointer user_data))
]
