"
https://developer.gnome.org/gtksourceview/stable/GtkSourceStyleSchemeManager.html
"
Class {
	#name : #GtkSourceStyleSchemeManager,
	#superclass : #GObject,
	#category : #'Gtk-SourceView-Base'
}

{ #category : #'instance creation' }
GtkSourceStyleSchemeManager class >> default [

	^ self getDefault
]

{ #category : #private }
GtkSourceStyleSchemeManager class >> getDefault [ 

	^ self 
		ffiCall: #(GtkSourceStyleSchemeManager *gtk_source_style_scheme_manager_get_default(void))
		module: GtkSourceViewLibrary
]

{ #category : #'instance creation' }
GtkSourceStyleSchemeManager class >> new [
	
	^ self sourceStyleSchemaManagerNew initialize
]

{ #category : #private }
GtkSourceStyleSchemeManager class >> sourceStyleSchemaManagerNew [

	^ self 
		ffiCall: #(GtkSourceStyleSchemeManager *gtk_source_style_scheme_manager_new (void))
		module: GtkSourceViewLibrary
]

{ #category : #private }
GtkSourceStyleSchemeManager >> getSchemeIds [

	^ self 
		ffiCall: #("gchar **"void *gtk_source_style_scheme_manager_get_scheme_ids(self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceStyleSchemeManager >> schemeIds [ 
	| ids |

	ids := self getSchemeIds asExternalAddress.
	(ids isNil or: [ ids isNull ]) ifTrue: [ ^ #() ].

	^ (ids 
		readArrayOf: (GObject resolveType: #gpointer) 
		until: [ :each | each isNull ])
		collect: [ :each | each readStringUTF8 ]
]

{ #category : #accessing }
GtkSourceStyleSchemeManager >> schemeWithId: id [ 

	^ self 
		ffiCall: #(GtkSourceLanguage *gtk_source_style_scheme_manager_get_scheme(
			self,
			const gchar *id))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceStyleSchemeManager >> searchPaths: anArrayOfString [
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

{ #category : #private }
GtkSourceStyleSchemeManager >> setSearchPath: dirs [

	self 
		ffiCall: #(void gtk_source_style_scheme_manager_set_search_path(self, "gchar **"void *dirs))
		module: GtkSourceViewLibrary
]
