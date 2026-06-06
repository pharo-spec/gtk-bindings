"
GtkSourceLanguage — Represents a syntax highlighted language

https://gnome.pages.gitlab.gnome.org/gtksourceview/gtksourceview5/class.Language.html
"
Class {
	#name : 'GtkSourceLanguage',
	#superclass : 'GObject',
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#category : 'GtkSourceView-Language',
	#package : 'GtkSourceView',
	#tag : 'Language'
}

{ #category : 'accessing' }
GtkSourceLanguage class >> gType [ 

	^ self 
		ffiCall: #(gsize gtk_source_language_get_type())
		module: GtkSourceViewLibrary
]

{ #category : 'instance creation' }
GtkSourceLanguage class >> new [

	self error: 'This can''t be made. You need to access languages through GtkSourceLanguageManager'
]

{ #category : 'private' }
GtkSourceLanguage >> getMimeTypes [

	^ self ffiCall: #(gchar** gtk_source_language_get_mime_types (self))
]

{ #category : 'accessing' }
GtkSourceLanguage >> id [ 

	^ self ffiCall: #(const gchar* gtk_source_language_get_id (self))
]

{ #category : 'testing' }
GtkSourceLanguage >> isHidden [

	^ self ffiCall: #(gboolean gtk_source_language_get_hidden (self))
]

{ #category : 'accessing' }
GtkSourceLanguage >> metadataOf: aName [

	^ self ffiCall: #(const gchar* gtk_source_language_get_metadata (
  		self,
  		const gchar* aName))
]

{ #category : 'accessing' }
GtkSourceLanguage >> mimeTypes [
	| addr |

	addr := self getMimeTypes.
	^ (addr
		   	readArrayOf: FFIOop new
		   	until: [ :each | each isNull ]) 
		collect: [ :each |
			each utf8StringFromCString ]
]

{ #category : 'accessing' }
GtkSourceLanguage >> name [

	^ self ffiCall: #(const gchar* gtk_source_language_get_name (self))
]

{ #category : 'accessing' }
GtkSourceLanguage >> section [

	^ self ffiCall: #(const gchar* gtk_source_language_get_section (self))

]
