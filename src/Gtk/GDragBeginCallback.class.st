"
The “drag-begin” signal

```
void
user_function (GtkWidget      *widget,
               GdkDragContext *context,
               gpointer        user_data)
```

The ::drag-begin signal is emitted on the drag source when a drag is started. A typical reason to connect to this signal is to set up a custom drag icon with e.g. gtk_drag_source_set_icon_pixbuf().

Note that some widgets set up a drag icon in the default handler of this signal, so you may have to use g_signal_connect_after() to override what the default handler did.
"
Class {
	#name : #GDragBeginCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Callbacks'
}

{ #category : #signalling }
GDragBeginCallback class >> signalName [

	^ 'drag-begin'
]

{ #category : #enumerating }
GDragBeginCallback >> do: aBlock [

	^ super do: [ :widget :context :user_data |
		aBlock 
			value: context 
			value: user_data ]
]

{ #category : #accessing }
GDragBeginCallback >> signature [

	^ #(void ("GtkWidget *"void *widget, "GdkDragContext *"void *context, gpointer user_data))
]
