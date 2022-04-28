"
The PangoContext structure stores global information used to control the itemization process.

https://developer.gnome.org/pango/unstable/pango-Text-Processing.html#PangoContext
"
Class {
	#name : #PangoContext,
	#superclass : #PangoObject,
	#category : #'Pango-Base'
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

{ #category : #itemizing }
PangoContext >> itemize: aString [
	"Answer a GList of PangoItem for a complete String, without any attribute."
		
	^ self
		  itemize: aString
		  attributes: PangoAttrList new

]

{ #category : #itemizing }
PangoContext >> itemize: aString attributes: aPangoAttrList [
	"Answer a GList of PangoItem for a complete String"
		
	| glist |
	glist := self
		  itemize: aString
		  startIndex: 0
		  length: aString size
		  attributes: aPangoAttrList
		  cachedIterator: ExternalAddress null.
		
	self flag: #todo. "LEAK! These items are not freed currently! read function doc"
	^ glist collect: [ :each |
		PangoItem fromHandle: each getHandle ]
]

{ #category : #private }
PangoContext >> itemize: aString startIndex: startIndex length: length attributes: aPangoAttrList cachedIterator: cachedIterator [
	"https://docs.gtk.org/Pango/func.itemize.html"

	^ self ffiCall: #(
		GList*
		pango_itemize (
			self,
			String aString,
			int startIndex,
			int length,
			PangoAttrList * aPangoAttrList,
			void * cachedIterator ))
]

{ #category : #accessing }
PangoContext >> language [

	^ self ffiCall: #(PangoLanguage *pango_context_get_language (self))
]

{ #category : #private }
PangoContext >> loadFontDescription: desc [

	^ self 
		ffiCall: #(
			PangoFont*
			pango_context_load_font (
			  self,
			  const PangoFontDescription* desc ))
		module: PangoLibrary
]

{ #category : #accessing }
PangoContext >> metrics [

	^ self getMetricsFontDescription: self fontDescription language: self language
]
