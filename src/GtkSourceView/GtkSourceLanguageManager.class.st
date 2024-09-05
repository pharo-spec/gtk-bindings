"
GtkSourceLanguageManager — Provides access to GtkSourceLanguages

https://developer.gnome.org/gtksourceview/unstable/GtkSourceLanguageManager.html#gtk-source-language-manager-get-language-ids
"
Class {
	#name : 'GtkSourceLanguageManager',
	#superclass : 'GObject',
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#category : 'GtkSourceView-Language',
	#package : 'GtkSourceView',
	#tag : 'Language'
}

{ #category : 'accessing languages' }
GtkSourceLanguageManager class >> c [

	^ self default languageWithId: 'c'
]

{ #category : 'instance creation' }
GtkSourceLanguageManager class >> default [

	^ self getDefault
]

{ #category : 'accessing languages' }
GtkSourceLanguageManager class >> diff [

	^ self default languageWithId: 'diff'
]

{ #category : 'accessing' }
GtkSourceLanguageManager class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_source_language_manager_get_type())
]

{ #category : 'private' }
GtkSourceLanguageManager class >> getDefault [ 

	^ self 
		ffiCall: #(GtkSourceLanguageManager *gtk_source_language_manager_get_default())
		module: GtkSourceViewLibrary
]

{ #category : 'accessing languages' }
GtkSourceLanguageManager class >> markdown [

	^ self default languageWithId: 'markdown'
]

{ #category : 'instance creation' }
GtkSourceLanguageManager class >> new [
	
	^ self sourceManagerLanguageNew initialize
]

{ #category : 'private' }
GtkSourceLanguageManager class >> sourceManagerLanguageNew [

	^ self 
		ffiCall: #(GtkSourceLanguageManager *gtk_source_language_manager_new (void))
		module: GtkSourceViewLibrary
]

{ #category : 'private' }
GtkSourceLanguageManager >> getLanguageIds [

	^ self 
		ffiCall: #("gchar **"void *gtk_source_language_manager_get_language_ids(self))
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceLanguageManager >> languageIds [ 
	| ids |

	ids := self getLanguageIds asExternalAddress.
	(ids isNil or: [ ids isNull ]) ifTrue: [ ^ #() ].

	^ (ids 
		readArrayOf: (GObject resolveType: #gpointer) 
		until: [ :each | each isNull ])
		collect: [ :each | each readStringUTF8 ]

]

{ #category : 'accessing' }
GtkSourceLanguageManager >> languageWithId: id [ 

	^ self 
		ffiCall: #(GtkSourceLanguage *gtk_source_language_manager_get_language(
			self,
			const gchar *id))
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceLanguageManager >> searchPaths: anArrayOfString [
	| array arrayOfPointers index |
	
	arrayOfPointers := anArrayOfString collect: [ :each | ExternalAddress fromString: each ].
	array := ByteArray new: (anArrayOfString size + 1) * FFIExternalType pointerSize.
	index := 1.
	arrayOfPointers do: [ :each |
		array pointerAt: index put: each.
		index := index + FFIExternalType pointerSize ].
	[ self setSearchPath: array ]
	ensure: [ 
		arrayOfPointers do: [ :each | each free ] ]
]

{ #category : 'private' }
GtkSourceLanguageManager >> setSearchPath: dirs [

	self 
		ffiCall: #(void gtk_source_language_manager_set_search_path(self, "gchar **"void *dirs))
		module: GtkSourceViewLibrary
]
