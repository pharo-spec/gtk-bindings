"
https://developer.gnome.org/gtksourceview/stable/GtkSourceStyleScheme.html
"
Class {
	#name : #GtkSourceStyleScheme,
	#superclass : #GObject,
	#category : #'Gtk-SourceView-Base'
}

{ #category : #accessing }
GtkSourceStyleScheme class >> gType [ 

	^ self 
		ffiCall: #(gsize gtk_source_style_scheme_get_type())
		module: GtkSourceViewLibrary
]

{ #category : #'instance creation' }
GtkSourceStyleScheme class >> new [

	self error: 'This can''t be made. You need to access languages through GtkSourceLanguageManager'
]
