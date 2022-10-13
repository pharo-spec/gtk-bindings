"
https://docs.gtk.org/gtk4/signal.Popover.closed.html
"
Class {
	#name : #GPopoverClosedCallback,
	#superclass : #GManagedSignalCallback,
	#category : #'Gtk-Widget-Menu'
}

{ #category : #signalling }
GPopoverClosedCallback class >> signalName [

	^ 'closed'
]

{ #category : #enumerating }
GPopoverClosedCallback >> do: aBlock [

	super do: [ :widget :user_data | aBlock value ] 
]
