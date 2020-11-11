"
The “size-allocate” signal

https://developer.gnome.org/gtk3/stable/GtkWidget.html#GtkWidget-size-allocate
"
Class {
	#name : #GSizeAllocateCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Base-Callbacks'
}

{ #category : #accessing }
GSizeAllocateCallback class >> signalName [

	^ 'size-allocate'
]

{ #category : #accessing }
GSizeAllocateCallback >> do: aBlock [

	super do: [ :widget :allocation :user_data | 
		aBlock cull: ((GdkRectangle fromHandle: allocation) asRectangle) ]
]

{ #category : #accessing }
GSizeAllocateCallback >> signature [

	^  #(void (void *widget, void *allocation, gpointer user_data))
]
