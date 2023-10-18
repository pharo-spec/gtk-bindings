"
https://docs.gtk.org/gtk4/signal.SignalListItemFactory.setup.html
"
Class {
	#name : 'GSetupCallback',
	#superclass : 'GManagedSignalCallback',
	#instVars : [
		'itemClass'
	],
	#category : 'Gtk-Event-Callbacks',
	#package : 'Gtk',
	#tag : 'Event-Callbacks'
}

{ #category : 'signalling' }
GSetupCallback class >> signalName [

	^ 'setup'
]

{ #category : 'enumerating' }
GSetupCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :factory :object :user_data | 
			aBlock value: (self itemClass fromHandleUnreferenced: object) ]
]

{ #category : 'accessing' }
GSetupCallback >> itemClass [
	
	^ itemClass
]

{ #category : 'accessing' }
GSetupCallback >> itemClass: aClass [
	
	itemClass := aClass
]

{ #category : 'accessing' }
GSetupCallback >> signature [

	^ #(void (void *factory, void *object, gpointer user_data))
]
