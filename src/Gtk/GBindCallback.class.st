"
e.g. https://docs.gtk.org/gtk4/signal.SignalListItemFactory.bind.html
"
Class {
	#name : 'GBindCallback',
	#superclass : 'GManagedSignalCallback',
	#instVars : [
		'itemClass'
	],
	#category : 'Gtk-Event-Callbacks',
	#package : 'Gtk',
	#tag : 'Event-Callbacks'
}

{ #category : 'signalling' }
GBindCallback class >> signalName [

	^ 'bind'
]

{ #category : 'enumerating' }
GBindCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :factory :object :user_data | 
			aBlock value: (self itemClass fromHandleUnreferenced: object) ]
]

{ #category : 'accessing' }
GBindCallback >> itemClass [
	
	^ itemClass
]

{ #category : 'accessing' }
GBindCallback >> itemClass: aClass [
	
	itemClass := aClass
]

{ #category : 'accessing' }
GBindCallback >> signature [

	^ #(void (void *factory, void *object, gpointer user_data))
]
