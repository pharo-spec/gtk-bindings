"
Emitted when an object has been unbound from its item, for example when a listitem was removed from use in a list widget and its GtkListItem:item is about to be unset.

https://docs.gtk.org/gtk4/signal.SignalListItemFactory.unbind.html
"
Class {
	#name : 'GUnbindCallback',
	#superclass : 'GManagedSignalCallback',
	#instVars : [
		'itemClass'
	],
	#category : 'Gtk-Event-Callbacks',
	#package : 'Gtk',
	#tag : 'Event-Callbacks'
}

{ #category : 'signalling' }
GUnbindCallback class >> signalName [

	^ 'bind'
]

{ #category : 'enumerating' }
GUnbindCallback >> do: aBlock [

	self 
		signature: self signature 
		block: [ :factory :object :user_data | 
			aBlock value: (self itemClass fromHandleUnreferenced: object) ]
]

{ #category : 'accessing' }
GUnbindCallback >> itemClass [
	
	^ itemClass
]

{ #category : 'accessing' }
GUnbindCallback >> itemClass: aClass [
	
	itemClass := aClass
]

{ #category : 'accessing' }
GUnbindCallback >> signature [

	^ #(void (void *factory, void *object, gpointer user_data))
]
