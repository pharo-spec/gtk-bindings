"
GtkIconTheme — Looking up icons by name

https://developer.gnome.org/gtk3/3.24/GtkIconTheme.html
"
Class {
	#name : #GtkIconTheme,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#category : #'Gtk-Widget-Display'
}

{ #category : #'instance creation' }
GtkIconTheme class >> default [

	^ self getDefault
]

{ #category : #private }
GtkIconTheme class >> getDefault [

	^ self ffiCall: #(GtkIconTheme *gtk_icon_theme_get_default ())
]

{ #category : #accessing }
GtkIconTheme >> allContextNames [
	| gList result |
	
	result := OrderedCollection new.
	gList := GList fromHandle: self listContexts.
	gList do: [ :data |
		data isNull ifFalse: [ 
			result add: data readStringUTF8.
			data gFree ] ].
	gList free.

	^ result
]

{ #category : #accessing }
GtkIconTheme >> allIcons [

	^ self allNames collect: [ :each | GtkImage newIconForButtonNamed: each ]
]

{ #category : #accessing }
GtkIconTheme >> allNames [
	| gList result |
	
	result := OrderedCollection new: 1000.
	gList := GList fromHandle: self listAllIcons.
	gList do: [ :data |
		data isNull ifFalse: [
			| name |
			name := data readStringUTF8.
			result add: name.
			data gFree ] ].
	gList free.

	^ result
]

{ #category : #accessing }
GtkIconTheme >> allNamesByContext [
	| namesByContext |
	
	namesByContext := Dictionary new.
	self allContextNames do: [ :each |
		namesByContext 
			at: each 
			put: (self iconNamesInContext: each) ].
	^ namesByContext
]

{ #category : #accessing }
GtkIconTheme >> iconNamesInContext: aString [
	| gList result |
	
	result := OrderedCollection new: 1000.
	gList := GList fromHandle: (self listIcons: aString).
	gList do: [ :data |
		data isNull ifFalse: [
			result add: data readStringUTF8.
			data gFree ] ].
	gList free.

	^ result
]

{ #category : #accessing }
GtkIconTheme >> iconsInContext: aName [

	^ (self iconNamesInContext: aName) collect: [ :each | GtkImage newIconForButtonNamed: each ]
]

{ #category : #private }
GtkIconTheme >> listAllIcons [

	^ self ffiCall: #("GList *"void *gtk_icon_theme_list_icons (self, NULL))
]

{ #category : #private }
GtkIconTheme >> listContexts [ 

	^ self ffiCall: #("GList *"void *gtk_icon_theme_list_contexts (self))
]

{ #category : #private }
GtkIconTheme >> listIcons: context [

	^ self ffiCall: #("GList *"void *gtk_icon_theme_list_icons (self, const gchar *context))
]

{ #category : #accessing }
GtkIconTheme >> loadIconName: iconName size: iconSize [ 
	| pixbuf error |		

	error := GError new.
	pixbuf := self loadIconName: iconName size: iconSize flags: 0 error: error.
	error isOk ifFalse: [ 
		GtkError signal: error messageString ].	
	pixbuf initialize.
	^ pixbuf
]

{ #category : #private }
GtkIconTheme >> loadIconName: icon_name size: size flags: flags error: error [ 

	self ffiCall: #(GdkPixbuf *gtk_icon_theme_load_icon(
		self, 
		const gchar *icon_name,
		gint size,
		"GtkIconLookupFlags"gint flags,
		"GError **"GError *error))
]
