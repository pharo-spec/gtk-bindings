"
GtkSourceCompletion — Main Completion Object

https://developer.gnome.org/gtksourceview/stable/GtkSourceCompletion.html
"
Class {
	#name : #GtkSourceCompletion,
	#superclass : #GObject,
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#instVars : [
		'providers'
	],
	#category : #'GtkSourceView-Completion'
}

{ #category : #accessing }
GtkSourceCompletion >> addProvider: provider [
	| ok errorHolder error |
	
	errorHolder := GErrorHolder new.
	ok := self addProvider: provider error: errorHolder. 
	error := errorHolder value.
	ok ifFalse: [ 
		GtkError signal: error messageString ].
	self keepProvider: provider
]

{ #category : #private }
GtkSourceCompletion >> addProvider: provider error: error [

	^ self ffiCall: #(gboolean gtk_source_completion_add_provider (
		self,
 		GObject *provider,
   		"GError **"GErrorHolder error))
]

{ #category : #private }
GtkSourceCompletion >> blockInteractive [

	^ self ffiCall: #(void gtk_source_completion_block_interactive(self))
]

{ #category : #accessing }
GtkSourceCompletion >> blockInteractiveDuring: aBlock [ 

	self blockInteractive.
	aBlock ensure: [ 
		self unblockInteractive ]
]

{ #category : #'library path' }
GtkSourceCompletion >> ffiLibraryName [

	^ GtkSourceViewLibrary
]

{ #category : #private }
GtkSourceCompletion >> keepProvider: provider [
	
	providers ifNil: [ providers := Set new ].
	providers add: provider
]

{ #category : #accessing }
GtkSourceCompletion >> showHeaders: aBoolean [ 

	self 
		gObjectSet: 'show-headers' 
		toBoolean: aBoolean
]

{ #category : #accessing }
GtkSourceCompletion >> showIcons: aBoolean [ 

	self 
		gObjectSet: 'show-icons' 
		toBoolean: aBoolean
]

{ #category : #private }
GtkSourceCompletion >> unblockInteractive [

	^ self ffiCall: #(void gtk_source_completion_unblock_interactive(self))
]
