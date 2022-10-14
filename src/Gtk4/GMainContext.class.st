Class {
	#name : #GMainContext,
	#superclass : #GBaseObject,
	#category : #Gtk4
}

{ #category : #accessing }
GMainContext class >> default [

	^ self ffiCall: #(GMainContext* g_main_context_default (void))
]
