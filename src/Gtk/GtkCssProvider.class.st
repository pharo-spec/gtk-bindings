"
GtkCssProvider — CSS-like styling for widgets

https://developer.gnome.org/gtk3/stable/GtkCssProvider.html
"
Class {
	#name : 'GtkCssProvider',
	#superclass : 'GtkStyleProvider',
	#classVars : [
		'GTK_STYLE_PROVIDER_PRIORITY_APPLICATION',
		'GTK_STYLE_PROVIDER_PRIORITY_USER'
	],
	#pools : [
		'GObjectTypes'
	],
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'private' }
GtkCssProvider class >> cssProviderNew [
	^ self ffiCall: #(GtkCssProvider *gtk_css_provider_new (void))
	
]

{ #category : 'private' }
GtkCssProvider class >> fileNameToUTF8: aString [
	| encoded read written errorHolder error |

	read := ExternalAddress new.
	written := ExternalAddress new.
	errorHolder := GErrorHolder new.
	encoded := self 
		fileNameToUTF8: aString 
		len: aString size 
		read: read 
		written: written
		error: errorHolder.

	error := errorHolder value.		
	error isOk ifFalse: [ 
		GtkError signal: error messageString ].
	
	^ encoded
]

{ #category : 'private' }
GtkCssProvider class >> fileNameToUTF8: opsysstring len: len read: bytes_read written: bytes_written error: error [

	self 
		ffiCall: #(gchar *g_filename_to_utf8 (
			const gchar *opsysstring,
			gssize len,
			gsize *bytes_read,
			gsize *bytes_written,
			"GError **"GErrorHolder error))
		module: GLibLibrary
]

{ #category : 'accessing' }
GtkCssProvider class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_css_provider_get_type())
]

{ #category : 'class initialization' }
GtkCssProvider class >> initialize [ 

	GTK_STYLE_PROVIDER_PRIORITY_APPLICATION := 600.
	GTK_STYLE_PROVIDER_PRIORITY_USER := 800
]

{ #category : 'instance creation' }
GtkCssProvider class >> new [ 
	^ self cssProviderNew initialize
]

{ #category : 'instance creation' }
GtkCssProvider class >> newFromPath: aString [

	^ self new loadFromPath: aString
]

{ #category : 'instance creation' }
GtkCssProvider class >> newFromReference: aFileReference [ 
	
	^ self newFromPath: aFileReference fullName
]

{ #category : 'instance creation' }
GtkCssProvider class >> newFromString: aString [

	^ self new loadFromData: aString
]

{ #category : 'accessing' }
GtkCssProvider >> addForApplicationToDefaultDisplay [

	self
		addForDisplay: GdkDisplay default
		priority: GTK_STYLE_PROVIDER_PRIORITY_APPLICATION
]

{ #category : 'accessing' }
GtkCssProvider >> addForApplicationToDefaultScreen [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkCssProvider >> addForDisplay: display priority: priority [

	self ffiCall: #(void gtk_style_context_add_provider_for_display (
		GdkDisplay *display,
		self,
		guint priority))
]

{ #category : 'private' }
GtkCssProvider >> addForScreen: screen priority: priority [

	self deprecated: #Gtk4
]

{ #category : 'accessing' }
GtkCssProvider >> addForUserToDefaultDisplay [

	self
		addForDisplay: GdkDisplay default
		priority: GTK_STYLE_PROVIDER_PRIORITY_USER
]

{ #category : 'accessing' }
GtkCssProvider >> addForUserToDefaultScreen [

	self deprecated: #Gtk
]

{ #category : 'accessing - loading' }
GtkCssProvider >> loadFromData: data [

	^ self ffiCall: #(void gtk_css_provider_load_from_data (
		self,
		gchar *data,
		gssize -1))
]

{ #category : 'accessing - loading' }
GtkCssProvider >> loadFromPath: path [

	^ self ffiCall: #(void gtk_css_provider_load_from_path (
		self,
		const gchar *path))
]

{ #category : 'accessing - loading' }
GtkCssProvider >> loadFromResource: resource_path [

	^ self ffiCall: #(gboolean gtk_css_provider_load_from_resource (
		self,
		const gchar *resource_path))
]

{ #category : 'converting' }
GtkCssProvider >> toString [

	^ self ffiCall: #(char *gtk_css_provider_to_string (self))
]
