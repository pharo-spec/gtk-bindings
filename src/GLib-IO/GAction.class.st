Class {
	#name : 'GAction',
	#superclass : 'GObject',
	#category : 'GLib-IO-Actions',
	#package : 'GLib-IO',
	#tag : 'Actions'
}

{ #category : 'accessing' }
GAction >> activate: parameter [
	
	self ffiCall: #(void g_action_activate (self, GVariant* parameter))
]
