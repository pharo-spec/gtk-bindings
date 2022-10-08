Class {
	#name : #Gtk4Engine,
	#superclass : #GEngine,
	#category : #Gtk4
}

{ #category : #testing }
Gtk4Engine class >> isAvailable [

	^ true
]

{ #category : #'system startup' }
Gtk4Engine >> ensureRunLoop [

	^ Gtk4RunLoop new
]

{ #category : #accessing }
Gtk4Engine >> naturalRunner [

	^ TFMainThreadRunner uniqueInstance
]

{ #category : #'private running' }
Gtk4Engine >> start [ 

]

{ #category : #'private running' }
Gtk4Engine >> stop [
]
