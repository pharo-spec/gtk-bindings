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
GtkStyleContext >> getActiveRGBAColor [
	| color state |
	
	color := GdkRGBA new.
	state := GTK_STATE_FLAG_ACTIVE.
	self getColor: color state: state.
	^ color
]

{ #category : #private }
GtkStyleContext >> getBackgroundColor: color state: state [
	
	^ self ffiCall: #(void *gtk_style_context_get_background_color  (self, GtkStateFlags state, GdkRGBA *color))
]

{ #category : #accessing }
GtkStyleContext >> getBackgroundRGBAColor [
	| color state |
	
	color := GdkRGBA new.
	state := GTK_STATE_FLAG_NORMAL.
	self getBackgroundColor: color state: state.
	^ color
]

{ #category : #private }
GtkStyleContext >> getColor: color state: state [
	
	^ self ffiCall: #(void gtk_style_context_get_color  (self, GtkStateFlags state, GdkRGBA *color))
]

{ #category : #private }
GtkStyleContext >> getFont: state [
	
	^ self ffiCall: #(PangoFontDescription *gtk_style_context_get_font (self, GtkStateFlags state))
]

{ #category : #accessing }
GtkStyleContext >> getPangoAttributes [

	^ self getPangoAttributesCSStyle: self lookupCSSStyle
]

{ #category : #private }
GtkStyleContext >> getPangoAttributesCSStyle: style [

	^ self ffiCall: #(PangoAttrList *gtk_css_style_get_pango_attributes (void *style))
]

{ #category : #accessing }
GtkStyleContext >> getRGBAColor [
	| color state |
	
	color := GdkRGBA new.
	state := GTK_STATE_FLAG_NORMAL.
	self getColor: color state: state.
	^ color
]

{ #category : #accessing }
GtkStyleContext >> getSelectedRGBAColor [
	| color state |
	
	color := GdkRGBA new.
	state := GTK_STATE_FLAG_SELECTED.
	self getColor: color state: state.
	^ color
]

{ #category : #private }
GtkStyleContext >> lookupCSSStyle [

	^ self ffiCall: #(void *gtk_style_context_lookup_style (self))
]

{ #category : #accessing }
GtkStyleContext >> lookupColor: aName [
	| color result |
	
	color := GdkRGBA new.
	result := self lookupColor: aName into: color.
	^ result 
		ifTrue: [ color ]
		ifFalse: [ nil ]
]

{ #category : #private }
GtkStyleContext >> lookupColor: color_name into: color [ 

	^ self ffiCall: #(gboolean gtk_style_context_lookup_color (
		self,
		const gchar *color_name,
		GdkRGBA *color))
]

{ #category : #accessing }
GtkStyleContext >> removeClass: class_name [

	^ self ffiCall: #(void gtk_style_context_remove_class (self, const gchar *class_name))
]

{ #category : #rendering }
GtkStyleContext >> renderLayout: layout cr: cr x: x y: y [

	self ffiCall: #(void gtk_render_layout (
		self,
		void         *cr,
		gdouble          x,
		gdouble          y,
		PangoLayout     *layout))
]

{ #category : #accessing }
GtkStyleContext >> restore [

	^ self ffiCall: #(void gtk_style_context_restore (self))
]

{ #category : #accessing }
GtkStyleContext >> save [

	^ self ffiCall: #(void gtk_style_context_save (self))
]
