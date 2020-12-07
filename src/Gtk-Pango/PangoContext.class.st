"
The PangoContext structure stores global information used to control the itemization process.

https://developer.gnome.org/pango/unstable/pango-Text-Processing.html#PangoContext
"
Class {
	#name : #PangoContext,
	#superclass : #PangoObject,
	#category : #'Gtk-Pango-Base'
}

{ #category : #finalization }
PangoContext class >> finalizeResourceData: handle [
	handle isNull ifTrue: [ ^ self ].
	^ self g_object_unref: handle
]

{ #category : #private }
PangoContext class >> g_object_unref: handle [
	^ self ffiCall: #( void g_object_unref (void *handle)) module: PangoLibrary
]

{ #category : #accessing }
PangoContext >> fontDescription [

	^ self ffiCall: #(PangoFontDescription *pango_context_get_font_description (self))
]

{ #category : #private }
PangoContext >> getMetricsFontDescription: desc language: language [

	^ self ffiCall: #(PangoFontMetrics *pango_context_get_metrics (
		self,
		PangoFontDescription *desc,
		PangoLanguage *language))
]

{ #category : #initialization }
PangoContext >> initialize [

	self autoRelease
]

{ #category : #accessing }
PangoContext >> language [

	^ self ffiCall: #(PangoLanguage *pango_context_get_language (self))
]

{ #category : #accessing }
PangoContext >> metrics [

	^ self getMetricsFontDescription: self fontDescription language: self language
]
