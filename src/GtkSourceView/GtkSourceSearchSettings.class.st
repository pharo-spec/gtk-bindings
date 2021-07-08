"
[https://developer.gnome.org/gtksourceview/stable/GtkSourceSearchSettings.html](https://developer.gnome.org/gtksourceview/stable/GtkSourceSearchSettings.html)
"
Class {
	#name : #GtkSourceSearchSettings,
	#superclass : #GObject,
	#category : #'GtkSourceView-Base'
}

{ #category : #testing }
GtkSourceSearchSettings >> atWordBoundaries [

	^ self 
		ffiCall: #(gboolean gtk_source_search_settings_get_at_word_boundaries (self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceSearchSettings >> atWordBoundaries: at_word_boundaries [

	^ self 
		ffiCall: #(void gtk_source_search_settings_set_at_word_boundaries (
			self,
			gboolean at_word_boundaries))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceSearchSettings >> caseSensitive: case_sensitive [

	^ self 
		ffiCall: #(void gtk_source_search_settings_set_case_sensitive (
			self,
			gboolean case_sensitive))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceSearchSettings >> isCaseSensitive [

	^ self 
		ffiCall: #(gboolean gtk_source_search_settings_get_case_sensitive (self))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceSearchSettings >> isRegexEnabled [

	^ self 
		ffiCall: #(gboolean gtk_source_search_settings_get_regex_enabled (self))
		module: GtkSourceViewLibrary
]

{ #category : #testing }
GtkSourceSearchSettings >> isWrapAround [

	^ self 
		ffiCall: #(gboolean gtk_source_search_settings_get_wrap_around (self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceSearchSettings >> regexEnabled: regex_enabled [

	^ self 
		ffiCall: #(void gtk_source_search_settings_get_regex_enabled (
			self,
			gboolean regex_enabled))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceSearchSettings >> searchText [

	^ self 
		ffiCall: #(gchar *gtk_source_search_settings_get_search_text (self))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceSearchSettings >> searchText: search_text [

	^ self 
		ffiCall: #(void gtk_source_search_settings_set_search_text (
			self,
			const gchar *search_text))
		module: GtkSourceViewLibrary
]

{ #category : #accessing }
GtkSourceSearchSettings >> wrapAround: wrap_around [

	^ self 
		ffiCall: #(void gtk_source_search_settings_set_wrap_around (
			self,
			gboolean wrap_around))
		module: GtkSourceViewLibrary
]
