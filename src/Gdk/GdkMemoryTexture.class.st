"
https://docs.gtk.org/gdk4/ctor.MemoryTexture.new.html
"
Class {
	#name : 'GdkMemoryTexture',
	#superclass : 'GdkTexture',
	#category : 'Gdk-Texture',
	#package : 'Gdk',
	#tag : 'Texture'
}

{ #category : 'private' }
GdkMemoryTexture class >> gdkNewWidth: width height: height format: memoryFormat bytes: bytes stride: stride [

	self ffiCall: #(GdkMemoryTexture *gdk_memory_texture_new (
  int width,
  int height,
  GdkMemoryFormat memoryFormat,
  GBytes* bytes,
  gsize stride))
]

{ #category : 'instance creation' }
GdkMemoryTexture class >> newWidth: width height: height format: memoryFormat bytes: bytes stride: stride [

	^ (self 
		gdkNewWidth: width 
			height: height 
			format: memoryFormat 
			bytes: bytes 
			stride: stride)
		initialize
]
