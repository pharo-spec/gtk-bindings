"
The “activate-link” signal

```
gboolean
user_function (GtkLinkButton *button,
               gpointer       user_data)
```

The ::activate-link signal is emitted each time the GtkLinkButton has been clicked.
"
Class {
	#name : #GActivateLinkCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Callbacks'
}

{ #category : #accessing }
GActivateLinkCallback class >> signalName [

	^ 'activate-link'
]

{ #category : #accessing }
GActivateLinkCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :user_data | aBlock value ]
]

{ #category : #accessing }
GActivateLinkCallback >> signature [

	^ #(gboolean (void *widget, gpointer user_data))
]
