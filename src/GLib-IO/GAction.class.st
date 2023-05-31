Class {
	#name : #GAction,
	#superclass : #GObject,
	#category : #'GLib-IO-Actions'
}

{ #category : #accessing }
GAction >> activate: parameter [
	
	self ffiCall: #(void g_action_activate (self, GVariant* parameter))
]
