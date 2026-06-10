"
https://docs.gtk.org/gdk4/ctor.MemoryTexture.new.html
"
Class {
	#name : 'GdkMemoryTexture',
	#superclass : 'GdkTexture',
	#classInstVars : [
		'mutex'
	],
	#category : 'Gdk-Texture',
	#package : 'Gdk',
	#tag : 'Texture'
}

{ #category : 'instance creation' }
GdkMemoryTexture class >> fromForm: aForm inApplication: anApplication [ 
	"Return a cached GdkPaintable for this form, storing it in the application properties."
	
	mutex ifNil: [ mutex := Mutex new ].
	^ mutex critical: [
		| cache paintable size |
		
		cache := anApplication 
			propertyAt: #gtkPaintablesByForm 
			ifAbsentPut: [ IdentityDictionary new ].

		cache 
			at: aForm
			ifAbsentPut: [
				paintable := aForm asGdkPaintable.
				size := aForm width @ aForm height.
				paintable computeConcreteSize: size defaults: size.
				paintable ] ]
]

{ #category : 'instance creation' }
GdkMemoryTexture class >> fromSurface: aForm [
	| bytes |

	logger trace.
	bytes := GBytes newData: aForm getDataPtr size: aForm privateHeight * aForm stride.
	^ [ self 
			newWidth: aForm width 
			height: aForm privateHeight
			format: GdkMemoryFormat GDK_MEMORY_DEFAULT
			bytes: bytes
			stride: aForm stride ]
		ensure: [ 
			bytes unref ]	
]

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
GdkMemoryTexture class >> newUnownedWidth: width height: height format: memoryFormat bytes: bytes stride: stride [

	^ (self 
		gdkNewWidth: width 
			height: height 
			format: memoryFormat 
			bytes: bytes 
			stride: stride)
		initializeUnowned
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
