Class {
	#name : 'GdkTexture',
	#superclass : 'GdkPaintable',
	#classTraits : 'GdkTPaintable classTrait',
	#category : 'Gdk-Texture',
	#package : 'Gdk',
	#tag : 'Texture'
}

{ #category : 'private' }
GdkTexture class >> gdkNewForPixbuf: pixbuf [

	self ffiCall: #(GdkTexture* gdk_texture_new_for_pixbuf (GdkPixbuf* pixbuf))
]

{ #category : 'private' }
GdkTexture class >> gdkNewFromBytes: bytes [

	self ffiCall: #(GdkTexture* gdk_texture_new_from_bytes (GBytes* bytes, "GError** error"NULL))
]

{ #category : 'instance creation' }
GdkTexture class >> newForPixbuf: aPixbuf [

	^ (self gdkNewForPixbuf: aPixbuf) initialize
]

{ #category : 'instance creation' }
GdkTexture class >> newFromBytes: bytes [

	^ (self gdkNewFromBytes: bytes) initialize
]
