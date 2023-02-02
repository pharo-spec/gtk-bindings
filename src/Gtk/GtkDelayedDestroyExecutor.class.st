"
An executor to be used when ""keep alive"" property is set, in dialogs.
"
Class {
	#name : #GtkDelayedDestroyExecutor,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #'Gtk-Widget-Window'
}

{ #category : #testing }
GtkDelayedDestroyExecutor class >> isDeprecated [

	^ true
]

{ #category : #finalization }
GtkDelayedDestroyExecutor >> finalize [

	"handle could have been nulled (when starting an image)"
	handle isNull ifTrue: [ ^ self ].
	GtkWidget widgetDestroy: handle
]

{ #category : #accessing }
GtkDelayedDestroyExecutor >> handle: aHandle [

	handle := aHandle
]
