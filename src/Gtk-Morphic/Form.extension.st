Extension { #name : 'Form' }

{ #category : '*Gtk-Morphic' }
Form >> asAthensSurface [

	^ AthensCairoSurface fromForm: self
]

{ #category : '*Gtk-Morphic' }
Form >> asGIcon [
	| bytes |

	"GIcons can interpret PNG but not our bitmaps, so I need to convert them first"	
	bytes := ByteArray streamContents: [ :stream |
		PNGReadWriter putForm: self onStream: stream ].

	^ GBytesIcon fromByteArray: bytes
]

{ #category : '*Gtk-Morphic' }
Form >> asGdkPaintable [

	^ self asGdkTexture
]

{ #category : '*Gtk-Morphic' }
Form >> asGdkPixbuf [

	^ GdkPixbuf newForm: self
]

{ #category : '*Gtk-Morphic' }
Form >> asGdkTexture [

	^ self asAthensSurface asGdkTexture
]

{ #category : '*Gtk-Morphic' }
Form >> asGtkImage [

	^ GtkImage newPaintable: self asGdkPaintable 
]
