Class {
	#name : 'PangoLayout',
	#superclass : 'PangoObject',
	#pools : [
		'PangoAlignment',
		'PangoFontDescription'
	],
	#category : 'Pango-Base',
	#package : 'Pango',
	#tag : 'Base'
}

{ #category : 'finalization' }
PangoLayout class >> finalizeResourceData: handle [
	handle isNull ifTrue: [ ^ self ].
	^ self g_object_unref: handle
]

{ #category : 'instance creation' }
PangoLayout class >> newCanvas: aCanvas [
	^ self pango_cairo_create_layout: aCanvas
]

{ #category : 'instance creation' }
PangoLayout class >> newContext: aContext [
	^ self pango_layout_new: aContext
]

{ #category : 'private' }
PangoLayout class >> pango_cairo_create_layout: cr [
	^ self 
		ffiCall: #(PangoLayout *pango_cairo_create_layout (AthensCairoCanvas cr))
		module: PangoCairoLibrary
]

{ #category : 'private' }
PangoLayout class >> pango_layout_new: context [
	^ self ffiCall: #(PangoLayout *pango_layout_new (PangoContext *context))
]

{ #category : 'accessing' }
PangoLayout >> alignment [

	^ self ffiCall: #(PangoAlignment pango_layout_get_alignment (self))
]

{ #category : 'accessing' }
PangoLayout >> attributes [

	^ self getAttributes
		  autoRelease;
		  yourself
]

{ #category : 'accessing' }
PangoLayout >> baseline [

	^ self ffiCall: #( int pango_layout_get_baseline ( self ) )
]

{ #category : 'finalization' }
PangoLayout >> finalize [

	handle isNull ifTrue: [ ^ self ].
	GRunLoop defer: [ 
		self unref.
		handle beNull ]
]

{ #category : 'accessing' }
PangoLayout >> fontDescription [
	self ffiCall: #(PangoFontDescription *pango_layout_get_font_description (self))
]

{ #category : 'accessing' }
PangoLayout >> fontDescription: desc [
	self ffiCall: #(void pango_layout_set_font_description (self, const PangoFontDescription *desc))
]

{ #category : 'accessing' }
PangoLayout >> getAttributes [
	"https://docs.gtk.org/Pango/method.Layout.get_attributes.html"

	^ self ffiCall: #( PangoAttrList* pango_layout_get_attributes ( self ) )
]

{ #category : 'accessing' }
PangoLayout >> height: height [
	"https://docs.gtk.org/Pango/method.Layout.set_height.html"

	self ffiCall: #(void pango_layout_set_height (self, int height))
]

{ #category : 'initialization' }
PangoLayout >> initialize [
	self autoRelease
]

{ #category : 'accessing' }
PangoLayout >> markup: markup [
	^ self ffiCall: #(void pango_layout_set_markup (self, const char *markup, -1))
]

{ #category : 'private' }
PangoLayout >> primGetSizeWidth: width height: height [
	self ffiCall: #(void pango_layout_get_size (self, int *width, int *height))

	
]

{ #category : 'accessing' }
PangoLayout >> scaledSize [

	^ (self size / PANGO_SCALE) asIntegerPoint
]

{ #category : 'accessing' }
PangoLayout >> setAlignment: alignment [

	self ffiCall: #(void pango_layout_set_alignment (self, PangoAlignment alignment))
]

{ #category : 'accessing' }
PangoLayout >> setAttributes: attrs [

	^ self ffiCall: #(void pango_layout_set_attributes ( self, PangoAttrList* attrs ))
]

{ #category : 'accessing' }
PangoLayout >> setEllipsize: ellipsize [
	"https://docs.gtk.org/Pango/method.Layout.set_ellipsize.html"

	self ffiCall: #(
		void
		pango_layout_set_ellipsize (
		  self,
		  PangoEllipsizeMode ellipsize
		))
]

{ #category : 'accessing' }
PangoLayout >> setJustify: justify [

	self ffiCall: #(
		void
		pango_layout_set_justify (
		  self,
		  bool justify
		))
]

{ #category : 'accessing' }
PangoLayout >> setLineSpacing: factor [
	"https://docs.gtk.org/Pango/method.Layout.set_line_spacing.html"

	self ffiCall: #(
		void
		pango_layout_set_line_spacing (
		  self,
		  float factor
		))
]

{ #category : 'accessing' }
PangoLayout >> size [ 
	| widthBuffer heightBuffer |
	
	widthBuffer := FFIInt32 newBuffer.
	heightBuffer := FFIInt32 newBuffer.
	self primGetSizeWidth: widthBuffer height: heightBuffer.
	^ (widthBuffer signedLongAt: 1) @ (heightBuffer signedLongAt: 1)
]

{ #category : 'accessing' }
PangoLayout >> text: text [
	self ffiCall: #(void pango_layout_set_text (self, const char *text, -1))
]

{ #category : 'private' }
PangoLayout >> unref [

	^ self ffiCall: #( void g_object_unref (self)) module: PangoLibrary
]

{ #category : 'accessing' }
PangoLayout >> width [

	self ffiCall: #(int pango_layout_get_width (self))
]

{ #category : 'accessing' }
PangoLayout >> width: width [
	self ffiCall: #(void pango_layout_set_width (self, int width))
]
