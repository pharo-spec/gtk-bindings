"
A GtkSourceBuffer object is the model for GtkSourceView widgets. It extends the GtkTextBuffer class by adding features useful to display and edit source code such as syntax highlighting and bracket matching. It also implements support for the undo/redo.

https://developer.gnome.org/gtksourceview/stable/GtkSourceBuffer.html
"
Class {
	#name : 'GtkSourceBuffer',
	#superclass : 'GtkTextBuffer',
	#traits : 'GtkSourceViewTLibrary',
	#classTraits : 'GtkSourceViewTLibrary classTrait',
	#instVars : [
		'language',
		'searchContext'
	],
	#category : 'GtkSourceView-Base',
	#package : 'GtkSourceView',
	#tag : 'Base'
}

{ #category : 'accessing' }
GtkSourceBuffer class >> gType [ 

	^ self 
		ffiCall: #(gsize gtk_source_buffer_get_type())
		module: GtkSourceViewLibrary
]

{ #category : 'instance creation' }
GtkSourceBuffer class >> new [

	^ self newTable: GObject null
]

{ #category : 'instance creation' }
GtkSourceBuffer class >> newTable: table [

	^ (self sourceBufferNew: table) initialize
]

{ #category : 'private' }
GtkSourceBuffer class >> sourceBufferNew: table [

	^ self 
		ffiCall: #(GtkSourceBuffer *gtk_source_buffer_new (GtkTextTagTable *table))
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceBuffer >> createSourceMarkNamed: name category: category where: where [

	^ self 	
		ffiCall: #(GtkSourceMark *gtk_source_buffer_create_source_mark (
			self,
			const gchar *name,
			const gchar *category,
			const GtkTextIter *where)) 
		module: GtkSourceViewLibrary
]

{ #category : 'private' }
GtkSourceBuffer >> getLanguage [

	^ self 
		ffiCall: #(GtkSourceLanguage *gtk_source_buffer_get_language (self)) 
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceBuffer >> highlightMatchingBrackets: highlight [

	^ self ffiCall: #(void gtk_source_buffer_set_highlight_matching_brackets (
		self, 
		gboolean highlight))
]

{ #category : 'accessing' }
GtkSourceBuffer >> highlightSyntax: highlight [

	self 
		ffiCall: #(void gtk_source_buffer_set_highlight_syntax (self, gboolean highlight))
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceBuffer >> implicitTrailingNewline: implicit_trailing_newline [

	self 
		ffiCall: #(void gtk_source_buffer_set_implicit_trailing_newline(
			self,
			gboolean implicit_trailing_newline))
		module: GtkSourceViewLibrary
]

{ #category : 'testing' }
GtkSourceBuffer >> isHighlightMatchingBrackets [

	^ self 
		ffiCall: #(gboolean gtk_source_buffer_get_highlight_matching_brackets(self))
		module: GtkSourceViewLibrary
]

{ #category : 'testing' }
GtkSourceBuffer >> isHighlightSyntax [

	self 
		ffiCall: #(gboolean gtk_source_buffer_get_highlight_syntax (self))
		module: GtkSourceViewLibrary
]

{ #category : 'testing' }
GtkSourceBuffer >> isImplicitTrailingNewline [

	^ self 
		ffiCall: #(gboolean gtk_source_buffer_get_implicit_trailing_newline (self))
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceBuffer >> language [

	^ language ifNil: [ language :=  self getLanguage ]
]

{ #category : 'accessing' }
GtkSourceBuffer >> language: aLanguage [

	language := aLanguage.
	self setLanguage: (language ifNil: [ GObject null ])
]

{ #category : 'private' }
GtkSourceBuffer >> newSearchContext [

	^ GtkSourceSearchContext newBuffer: self
]

{ #category : 'accessing' }
GtkSourceBuffer >> removeSourceMarksStart: start end: end category: category [  

	self ffiCall: #(void gtk_source_buffer_remove_source_marks (
		self,
 		GtkTextIter *start,
		GtkTextIter *end,
		gchar *category))
]

{ #category : 'accessing' }
GtkSourceBuffer >> searchContext [

	^ searchContext ifNil: [ searchContext := self newSearchContext ]
]

{ #category : 'private' }
GtkSourceBuffer >> setLanguage: aLanguage [

	^ self 
		ffiCall: #(void gtk_source_buffer_set_language (self, GtkSourceLanguage *aLanguage)) 
		module: GtkSourceViewLibrary
]

{ #category : 'accessing' }
GtkSourceBuffer >> styleScheme: scheme [

	self ffiCall: #(void gtk_source_buffer_set_style_scheme (
		self, 
		GtkSourceStyleScheme *scheme))
]
