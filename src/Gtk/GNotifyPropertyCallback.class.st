"
https://docs.gtk.org/gobject/signal.Object.notify.html
"
Class {
	#name : #GNotifyPropertyCallback,
	#superclass : #GManagedSignalCallback,
	#instVars : [
		'property'
	],
	#category : #'Gtk-Event-Callbacks'
}

{ #category : #'instance creation' }
GNotifyPropertyCallback class >> property: aName do: aBlock [

	^ self new 
		property: aName;
		do: aBlock;
		yourself
]

{ #category : #signalling }
GNotifyPropertyCallback class >> signalName [

	^ nil
]

{ #category : #enumerating }
GNotifyPropertyCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :widget :spec :user_data | aBlock cull: spec  ]
]

{ #category : #accessing }
GNotifyPropertyCallback >> property [

	^ property
]

{ #category : #accessing }
GNotifyPropertyCallback >> property: anObject [

	property := anObject
]

{ #category : #signalling }
GNotifyPropertyCallback >> signalName [

	^ 'notify::{1}' format: { self property }
]

{ #category : #accessing }
GNotifyPropertyCallback >> signature [

	^ #(void (void *widget, void *spec, gpointer user_data))
]
