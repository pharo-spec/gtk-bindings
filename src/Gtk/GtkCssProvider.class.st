"
GtkCssProvider — CSS-like styling for widgets

https://developer.gnome.org/gtk3/stable/GtkCssProvider.html
"
Class {
	#name : #GtkCssProvider,
	#superclass : #GtkStyleProvider,
	#classVars : [
		'GTK_STYLE_PROVIDER_PRIORITY_APPLICATION',
		'GTK_STYLE_PROVIDER_PRIORITY_USER'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Misc'
}

{ #category : #private }
GtkCssProvider class >> cssProviderNew [
	^ self ffiCall: #(GtkCssProvider *gtk_css_provider_new (void))
	
]

{ #category : #private }
GtkCssProvider class >> fileNameToUTF8: aString [
	| encoded read written errorBuffer error |
	
	read := ExternalAddress new.
	written := ExternalAddress new.
	errorBuffer := FFIOop newBuffer.
	encoded := self 
		fileNameToUTF8: aString 
		len: aString size 
		read: read 
		written: written
		error: errorBuffer.

	error := GError fromPointerBuffer: errorBuffer.		
	error isOk ifFalse: [ 
		GtkError signal: error messageString ].
	
	^ encoded
]

{ #category : #private }
GtkCssProvider class >> fileNameToUTF8: opsysstring len: len read: bytes_read written: bytes_written error: error [

	self 
		ffiCall: #(gchar *g_filename_to_utf8 (
			const gchar *opsysstring,
			gssize len,
			gsize *bytes_read,
			gsize *bytes_written,
			"GError **"void *error))
		module: GLibLibrary
]

{ #category : #accessing }
GtkCssProvider class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_css_provider_get_type())
]

{ #category : #'class initialization' }
GtkCssProvider class >> initialize [ 

	GTK_STYLE_PROVIDER_PRIORITY_APPLICATION := 600.
	GTK_STYLE_PROVIDER_PRIORITY_USER := 800
]

{ #category : #'instance creation' }
GtkCssProvider class >> new [ 
	^ self cssProviderNew initialize
]

{ #category : #'instance creation' }
GtkCssProvider class >> newFromPath: aString [

	^ self new loadFromPath: aString
]

{ #category : #'instance creation' }
GtkCssProvider class >> newFromReference: aFileReference [ 
	
	^ self newFromPath: aFileReference fullName
]

{ #category : #'instance creation' }
GtkCssProvider class >> newFromString: aString [

	^ self new loadFromData: aString
]

{ #category : #accessing }
GtkCssProvider >> addForApplicationToDefaultScreen [

	self 
		addForScreen: GdkScreen default 
		priority: GTK_STYLE_PROVIDER_PRIORITY_APPLICATION
]

{ #category : #private }
GtkCssProvider >> addForScreen: screen priority: priority [

	^ self ffiCall: #(void gtk_style_context_add_provider_for_screen(
		GdkScreen *screen,
		self,
		guint priority))
]

{ #category : #accessing }
GtkCssProvider >> addForUserToDefaultScreen [

	self 
		addForScreen: GdkScreen default 
		priority: GTK_STYLE_PROVIDER_PRIORITY_USER
]

{ #category : #accessing }
GtkCssProvider >> loadFromData: aString [
	| errorBuffer error |
	
	errorBuffer := FFIOop newBuffer.
	(self loadFromData: aString length: aString size error: errorBuffer)
		ifFalse: [ 
			error := GError fromPointerBuffer: errorBuffer.
			GtkError signal: error messageString ]
]

{ #category : #private }
GtkCssProvider >> loadFromData: data length: length error: error [
	^ self ffiCall: #(gboolean gtk_css_provider_load_from_data (
		self,
		const gchar *data,
		gssize length,
		"GError *"void *error))
]

{ #category : #accessing }
GtkCssProvider >> loadFromPath: path [
	| encodedPath errorBuffer error |
	
	errorBuffer := FFIOop newBuffer.
	encodedPath := self class fileNameToUTF8: path.
	(self loadFromPath: encodedPath error: errorBuffer ) 
		ifFalse: [ 
			error := GError fromPointerBuffer: errorBuffer.
			GtkError signal: error messageString ]
]

{ #category : #private }
GtkCssProvider >> loadFromPath: path error: error [
	^ self ffiCall: #(gboolean gtk_css_provider_load_from_path (
		self, 
		const gchar *path,
		"GError **"void *error))
]

{ #category : #accessing }
GtkCssProvider >> toString [ 

	^ self ffiCall: #(char *gtk_css_provider_to_string (self))
]
