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

{ #category : #finalization }
GtkDelayedDestroyExecutor >> finalize [

	GtkWidget widgetDestroy: handle
]

{ #category : #accessing }
GtkDelayedDestroyExecutor >> handle: aHandle [

	handle := aHandle
]
