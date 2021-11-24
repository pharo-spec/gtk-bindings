Class {
	#name : #GtkStyleContext,
	#superclass : #GObject,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#classVars : [
		'GTK_STYLE_PROVIDER_PRIORITY_APPLICATION',
		'GTK_STYLE_PROVIDER_PRIORITY_FALLBACK',
		'GTK_STYLE_PROVIDER_PRIORITY_SETTINGS',
		'GTK_STYLE_PROVIDER_PRIORITY_THEME',
		'GTK_STYLE_PROVIDER_PRIORITY_USER'
	],
	#pools : [
		'GtkStateFlags'
	],
	#category : #'Gtk-Styles'
}

{ #category : #accessing }
GtkStyleContext class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_style_context_get_type())
]

{ #category : #'class initialization' }
GtkStyleContext class >> initialize [ 

	GTK_STYLE_PROVIDER_PRIORITY_FALLBACK := 1.
	GTK_STYLE_PROVIDER_PRIORITY_THEME := 200.
	GTK_STYLE_PROVIDER_PRIORITY_SETTINGS := 400.
	GTK_STYLE_PROVIDER_PRIORITY_APPLICATION := 600.
	GTK_STYLE_PROVIDER_PRIORITY_USER := 800
]

{ #category : #accessing }
GtkStyleContext >> addClass: class_name [

	^ self ffiCall: #(void gtk_style_context_add_class (self, const gchar *class_name))
]

{ #category : #accessing }
GtkStyleContext >> addProvider: aProvider [

	self addProvider: aProvider priority: GTK_STYLE_PROVIDER_PRIORITY_USER
]

{ #category : #accessing }
GtkStyleContext >> addProvider: provider priority: priority [

	self ffiCall: #(void gtk_style_context_add_provider (
		self,
 		GtkStyleProvider *provider,
 		guint priority))
]

{ #category : #accessing }
GtkStyleContext >> fontNormal [

	^ self getFont: GTK_STATE_FLAG_NORMAL
]

{ #category : #accessing }
GtkStyleContext >> getActiveColor [

	| color state |
	
	color := GdkRGBA new.
	state := GTK_STATE_FLAG_ACTIVE.

	self getColor: color state: state.
	^ color asColor
]

{ #category : #accessing }
GtkStyleContext >> getBackgroundColor [

	| color state |
	
	color := GdkRGBA new.
	state := GTK_STATE_FLAG_NORMAL.

	self getBackgroundColor: color state: state.
	^ color asColor
]

{ #category : #accessing }
GtkStyleContext >> getBackgroundColor: color state: state [
	
	^ self ffiCall: #(void *gtk_style_context_get_background_color  (self, GtkStateFlags state, GdkRGBA *color))
]

{ #category : #accessing }
GtkStyleContext >> getColor [

	| color state |
	
	color := GdkRGBA new.
	state := GTK_STATE_FLAG_NORMAL.

	self getColor: color state: state.
	^ color asColor
]

{ #category : #accessing }
GtkStyleContext >> getColor: color state: state [
	
	^ self ffiCall: #(void *gtk_style_context_get_color  (self, GtkStateFlags state, GdkRGBA *color))
]

{ #category : #private }
GtkStyleContext >> getFont: state [
	
	^ self ffiCall: #(PangoFontDescription *gtk_style_context_get_font (self, GtkStateFlags state))
]

{ #category : #accessing }
GtkStyleContext >> getSelectedColor [

	| color state |
	
	color := GdkRGBA new.
	state := GTK_STATE_FLAG_SELECTED.

	self getColor: color state: state.
	^ color asColor
]

{ #category : #accessing }
GtkStyleContext >> removeClass: class_name [

	^ self ffiCall: #(void gtk_style_context_remove_class (self, const gchar *class_name))
]
