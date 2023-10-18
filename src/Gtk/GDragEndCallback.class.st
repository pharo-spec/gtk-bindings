"
The “drag-end” signal

```
void
user_function (GtkWidget      *widget,
               GdkDragContext *context,
               gpointer        user_data)
```

The ::drag-end signal is emitted on the drag source when a drag is finished. A typical reason to connect to this signal is to undo things done in “drag-begin”.
Parameters

"
Class {
	#name : 'GDragEndCallback',
	#superclass : 'GManagedSignalCallback',
	#category : 'Gtk-Callbacks',
	#package : 'Gtk',
	#tag : 'Callbacks'
}

{ #category : 'signalling' }
GDragEndCallback class >> signalName [

	^ 'drag-end'
]

{ #category : 'enumerating' }
GDragEndCallback >> do: aBlock [

	^ super do: [ :widget :context :user_data |
		aBlock 
			value: context 
			value: user_data ]
]

{ #category : 'accessing' }
GDragEndCallback >> signature [

	^ #(void ("GtkWidget *"void *widget, "GdkDragContext *"void *context, gpointer user_data))
]
