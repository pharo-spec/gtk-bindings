Class {
	#name : #Gtk4Widget,
	#superclass : #GObject,
	#traits : 'Gtk4TLibrary',
	#classTraits : 'Gtk4TLibrary classTrait',
	#category : #Gtk4
}

{ #category : #accessing }
Gtk4Widget >> hide [

	self ffiCall: #(void gtk_widget_hide (self))
]

{ #category : #accessing }
Gtk4Widget >> show [

	self ffiCall: #(void gtk_widget_show (self))
]
