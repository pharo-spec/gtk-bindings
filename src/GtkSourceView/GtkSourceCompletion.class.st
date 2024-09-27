"
GtkSourceCompletion — Main Completion Object

https://developer.gnome.org/gtksourceview/stable/GtkSourceCompletion.html
"
Class {
	#name : 'GtkSourceCompletion',
	#superclass : 'GObject',
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#instVars : [
		'providers'
	],
	#category : 'GtkSourceView-Completion',
	#package : 'GtkSourceView',
	#tag : 'Completion'
}

{ #category : 'accessing' }
GtkSourceCompletion >> addProvider: provider [

	self keepProvider: provider.
	self basicAddProvider: provider.
	provider objectUnrefNow
]

{ #category : 'private' }
GtkSourceCompletion >> basicAddProvider: provider [

	^ self ffiCall: #(void gtk_source_completion_add_provider (
		self,
 		GObject *provider))
]

{ #category : 'private' }
GtkSourceCompletion >> blockInteractive [

	^ self ffiCall: #(void gtk_source_completion_block_interactive(self))
]

{ #category : 'accessing' }
GtkSourceCompletion >> blockInteractiveDuring: aBlock [ 

	self blockInteractive.
	aBlock ensure: [ 
		self unblockInteractive ]
]

{ #category : 'library path' }
GtkSourceCompletion >> ffiLibraryName [

	^ GtkSourceViewLibrary
]

{ #category : 'private' }
GtkSourceCompletion >> keepProvider: provider [
	
	providers ifNil: [ providers := Set new ].
	providers add: provider
]

{ #category : 'accessing' }
GtkSourceCompletion >> pageSize [

	^ self ffiCall: #(guint gtk_source_completion_get_page_size (self))
]

{ #category : 'accessing' }
GtkSourceCompletion >> pageSize: page_size [

	self ffiCall: #(void gtk_source_completion_set_page_size (
  		self,
  		guint page_size))
]

{ #category : 'accessing' }
GtkSourceCompletion >> showIcons: aBoolean [ 

	self 
		gObjectSet: 'show-icons' 
		toBoolean: aBoolean
]

{ #category : 'private' }
GtkSourceCompletion >> unblockInteractive [

	^ self ffiCall: #(void gtk_source_completion_unblock_interactive(self))
]
