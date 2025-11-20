"
I'm a widget displaying an image.

https://developer.gnome.org/gtk3/stable/GtkImage.html
"
Class {
	#name : 'GtkImage',
	#superclass : 'GtkWidget',
	#pools : [
		'AthensCairoDefinitions',
		'GtkIconSize',
		'GtkImageType'
	],
	#category : 'Gtk-Widget-Display',
	#package : 'Gtk',
	#tag : 'Widget-Display'
}

{ #category : 'private' }
GtkImage class >> basicNewEmpty [

	^ self ffiCall: #(GtkImage *gtk_image_new ())
]

{ #category : 'accessing' }
GtkImage class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_image_get_type())
]

{ #category : 'private' }
GtkImage class >> imageNewFromIconName: icon_name [

	self ffiCall: #(GtkImage *gtk_image_new_from_icon_name (const char* icon_name))
]

{ #category : 'private' }
GtkImage class >> imageNewFromPaintable: paintable [

	^ self ffiCall: #(GtkImage *gtk_image_new_from_paintable (GdkPaintable *paintable))
]

{ #category : 'private' }
GtkImage class >> imageNewFromPixbuf: pixbuf [ 

	^ self ffiCall: #(GtkImage *gtk_image_new_from_pixbuf (GdkPixbuf *pixbuf))
]

{ #category : 'utilities' }
GtkImage class >> loadFromThemeIconNamed: aName size: aSize [
	"an utility method that helps on loading an image from the icon theme"
	| paintable | 
	
	paintable := GtkIconTheme default lookupIconName: aName size: aSize.
	^ paintable ifNotNil: [
		[ self newPaintable: paintable ]
		ensure: [ paintable objectUnref ] ]
]

{ #category : 'instance creation' }
GtkImage class >> new [

	^ self newEmpty
]

{ #category : 'instance creation' }
GtkImage class >> newEmpty [

	^ self basicNewEmpty initialize
]

{ #category : 'instance creation' }
GtkImage class >> newIconName: aString [

	^ (self imageNewFromIconName: aString) initialize
]

{ #category : 'instance creation' }
GtkImage class >> newPaintable: aPaintable [ 

	^ (self imageNewFromPaintable: aPaintable) initialize
]

{ #category : 'instance creation' }
GtkImage class >> newPixbuf: aGdkPixbuf [ 

	^ (self imageNewFromPixbuf: aGdkPixbuf) initialize
]

{ #category : 'private' }
GtkImage class >> surfaceFor: anImageMorph [
	| surface |

	surface := AthensCairoSurface extent: anImageMorph extent.
	surface drawDuring: [ :canvas |
		anImageMorph drawOnAthensCanvas: canvas ].

	^ surface
]

{ #category : 'converting' }
GtkImage >> asGdkPaintable [
	| type |

	type := self imageType.
	type = GTK_IMAGE_ICON_NAME ifTrue: [
		^ GtkIconPaintable newFromIconName: self iconName size: self iconSize ].
	(type = GTK_IMAGE_EMPTY or: [ type = GTK_IMAGE_PAINTABLE ]) ifTrue: [
		^ self getPaintable ].

	self error: 'I can''t find a paintable to answer.'.

	^ nil
]

{ #category : 'converting' }
GtkImage >> asGtkImage [

	^ self
]

{ #category : 'accessing' }
GtkImage >> clear [
	
	^ self ffiCall: #(void gtk_image_clear(self))
]

{ #category : 'private' }
GtkImage >> getIconName: icon_name size: size [
	
	^ self ffiCall: #(void gtk_image_get_icon_name (self,
                         "const gchar **"void *icon_name,
                         "GtkIconSize *"void *size))
]

{ #category : 'private' }
GtkImage >> getPaintable [

	^ self ffiCall: #(GdkPaintable *gtk_image_get_paintable())
]

{ #category : 'private' }
GtkImage >> getPixbuf [

	self deprecated: #Gtk4
]

{ #category : 'private' }
GtkImage >> iconName [

	^ self gObjectGetString: 'icon-name'
]

{ #category : 'private' }
GtkImage >> iconSize [

	^ self gObjectGetInteger: 'icon-size'
]

{ #category : 'private' }
GtkImage >> imageType [

	^ self ffiCall: #(GtkImageType gtk_image_get_storage_type (self))
]

{ #category : 'accessing' }
GtkImage >> pixbuf: pixbuf [

	self ffiCall: #(void gtk_image_set_from_pixbuf (self, GdkPixbuf* pixbuf))
]

{ #category : 'converting' }
GtkImage >> setFromGdkPixbuf: pixbuf [

	^ self ffiCall: #(void gtk_image_set_from_pixbuf(self, GdkPixbuf *pixbuf))
]

{ #category : 'converting' }
GtkImage >> setFromPaintable: paintable [

	^ self ffiCall: #(void gtk_image_set_from_paintable (self, GdkPaintable* paintable))
]
