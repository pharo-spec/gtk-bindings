"
https://docs.gtk.org/gdk4/enum.MemoryFormat.html
"
Class {
	#name : 'GdkMemoryFormat',
	#superclass : 'GEnumeration',
	#classVars : [
		'GDK_MEMORY_A8B8G8R8',
		'GDK_MEMORY_A8R8G8B8',
		'GDK_MEMORY_A8R8G8B8_PREMULTIPLIED',
		'GDK_MEMORY_B8G8R8',
		'GDK_MEMORY_B8G8R8A8',
		'GDK_MEMORY_B8G8R8A8_PREMULTIPLIED',
		'GDK_MEMORY_DEFAULT',
		'GDK_MEMORY_N_FORMATS',
		'GDK_MEMORY_R16G16B16',
		'GDK_MEMORY_R16G16B16A16',
		'GDK_MEMORY_R16G16B16A16_FLOAT',
		'GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED',
		'GDK_MEMORY_R16G16B16A16_PREMULTIPLIED',
		'GDK_MEMORY_R16G16B16_FLOAT',
		'GDK_MEMORY_R32G32B32A32_FLOAT',
		'GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED',
		'GDK_MEMORY_R32G32B32_FLOAT',
		'GDK_MEMORY_R8G8B8',
		'GDK_MEMORY_R8G8B8A8',
		'GDK_MEMORY_R8G8B8A8_PREMULTIPLIED'
	],
	#category : 'Gdk-Texture',
	#package : 'Gdk',
	#tag : 'Texture'
}

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_A8B8G8R8 [
	"This method was automatically generated"
	^ GDK_MEMORY_A8B8G8R8
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_A8R8G8B8 [
	"This method was automatically generated"
	^ GDK_MEMORY_A8R8G8B8
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_A8R8G8B8_PREMULTIPLIED [
	"This method was automatically generated"
	^ GDK_MEMORY_A8R8G8B8_PREMULTIPLIED
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_B8G8R8 [
	"This method was automatically generated"
	^ GDK_MEMORY_B8G8R8
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_B8G8R8A8 [
	"This method was automatically generated"
	^ GDK_MEMORY_B8G8R8A8
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_B8G8R8A8_PREMULTIPLIED [
	"This method was automatically generated"
	^ GDK_MEMORY_B8G8R8A8_PREMULTIPLIED
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_DEFAULT [

	^ GDK_MEMORY_DEFAULT
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_N_FORMATS [
	"This method was automatically generated"
	^ GDK_MEMORY_N_FORMATS
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R16G16B16 [
	"This method was automatically generated"
	^ GDK_MEMORY_R16G16B16
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R16G16B16A16 [
	"This method was automatically generated"
	^ GDK_MEMORY_R16G16B16A16
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R16G16B16A16_FLOAT [
	"This method was automatically generated"
	^ GDK_MEMORY_R16G16B16A16_FLOAT
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED [
	"This method was automatically generated"
	^ GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R16G16B16A16_PREMULTIPLIED [
	"This method was automatically generated"
	^ GDK_MEMORY_R16G16B16A16_PREMULTIPLIED
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R16G16B16_FLOAT [
	"This method was automatically generated"
	^ GDK_MEMORY_R16G16B16_FLOAT
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R32G32B32A32_FLOAT [
	"This method was automatically generated"
	^ GDK_MEMORY_R32G32B32A32_FLOAT
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED [
	"This method was automatically generated"
	^ GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R32G32B32_FLOAT [
	"This method was automatically generated"
	^ GDK_MEMORY_R32G32B32_FLOAT
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R8G8B8 [
	"This method was automatically generated"
	^ GDK_MEMORY_R8G8B8
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R8G8B8A8 [
	"This method was automatically generated"
	^ GDK_MEMORY_R8G8B8A8
]

{ #category : 'accessing enum' }
GdkMemoryFormat class >> GDK_MEMORY_R8G8B8A8_PREMULTIPLIED [
	"This method was automatically generated"
	^ GDK_MEMORY_R8G8B8A8_PREMULTIPLIED
]

{ #category : 'enum declaration' }
GdkMemoryFormat class >> enumDecl [
	"self initializeEnumeration.
	 self rebuildEnumAccessors"

	^ #(
  GDK_MEMORY_B8G8R8A8_PREMULTIPLIED 					0
  GDK_MEMORY_A8R8G8B8_PREMULTIPLIED					1
  GDK_MEMORY_R8G8B8A8_PREMULTIPLIED					2
  GDK_MEMORY_B8G8R8A8										3
  GDK_MEMORY_A8R8G8B8	 									4
  GDK_MEMORY_R8G8B8A8 									5
  GDK_MEMORY_A8B8G8R8 									6
  GDK_MEMORY_R8G8B8 										7
  GDK_MEMORY_B8G8R8 										8
  GDK_MEMORY_R16G16B16 									9
  GDK_MEMORY_R16G16B16A16_PREMULTIPLIED 			10
  GDK_MEMORY_R16G16B16A16 								11
  GDK_MEMORY_R16G16B16_FLOAT 							12
  GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED 	13
  GDK_MEMORY_R16G16B16A16_FLOAT 						14
  GDK_MEMORY_R32G32B32_FLOAT 							15
  GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED 	16
  GDK_MEMORY_R32G32B32A32_FLOAT 						17
  GDK_MEMORY_N_FORMATS 									18
	)
]

{ #category : 'initialization' }
GdkMemoryFormat class >> initialize [

	self initializeEnumeration.
	
	"#if G_BYTE_ORDER == G_LITTLE_ENDIAN
	#define GDK_MEMORY_DEFAULT GDK_MEMORY_B8G8R8A8_PREMULTIPLIED
	#elif G_BYTE_ORDER == G_BIG_ENDIAN
	#define GDK_MEMORY_DEFAULT GDK_MEMORY_A8R8G8B8_PREMULTIPLIED
	#endif".
	
	GDK_MEMORY_DEFAULT := GDK_MEMORY_B8G8R8A8_PREMULTIPLIED
]
