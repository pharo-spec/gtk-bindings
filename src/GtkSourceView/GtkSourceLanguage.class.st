"
GtkSourceLanguage — Represents a syntax highlighted language

https://developer.gnome.org/gtksourceview/unstable/GtkSourceLanguage.html
"
Class {
	#name : #GtkSourceLanguage,
	#superclass : #GObject,
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#category : #'GtkSourceView-Base'
}

{ #category : #accessing }
GtkSourceLanguage class >> gType [ 

	^ self 
		ffiCall: #(gsize gtk_source_language_get_type())
		module: GtkSourceViewLibrary
]

{ #category : #'instance creation' }
GtkSourceLanguage class >> new [

	self error: 'This can''t be made. You need to access languages through GtkSourceLanguageManager'
]
