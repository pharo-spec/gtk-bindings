"
I'm a widget displaying an image.

https://developer.gnome.org/gtk3/stable/GtkImage.html
"
Class {
	#name : #GtkImage,
	#superclass : #GtkWidget,
	#pools : [
		'AthensCairoDefinitions',
		'GtkIconSize',
		'GtkImageType'
	],
	#category : #'Gtk-Widget-Display'
}

{ #category : #private }
GtkImage class >> basicNewEmpty [

	^ self ffiCall: #(GtkImage *gtk_image_new ())
]

{ #category : #accessing }
GtkImage class >> gType [ 
	"This method was automatically generated"

	^ self ffiCall: #(gsize gtk_image_get_type())
]

{ #category : #private }
GtkImage class >> imageNewFromPixbuf: pixbuf [ 

	^ self ffiCall: #(GtkImage *gtk_image_new_from_pixbuf (GdkPixbuf *pixbuf))
]

{ #category : #'instance creation' }
GtkImage class >> new [

	^ self newEmpty
]

{ #category : #'instance creation' }
GtkImage class >> newEmpty [

	^ self basicNewEmpty initialize
]

{ #category : #'instance creation' }
GtkImage class >> newPixbuf: aGdkPixbuf [ 

	^ (self imageNewFromPixbuf: aGdkPixbuf) initialize
]

{ #category : #converting }
GtkImage >> asGdkPixbuf [
	"this will only work if the image it self is creared from a pixbuf. 
	 Most of the time you are better going through GdkPixbuf creation methods."
	| type |

	type := self imageType.
	type == GTK_IMAGE_PIXBUF ifTrue: [ 
		^ self getPixbuf ].
	type == GTK_IMAGE_ICON_NAME ifTrue: [ 
		^ GdkPixbuf newFromIconName: self iconName size: self iconSize ].
	
	^ nil
]

{ #category : #converting }
GtkImage >> asGtkImage [

	^ self
]

{ #category : #accessing }
GtkImage >> clear [
	
	^ self ffiCall: #(void gtk_image_clear(self))
]

{ #category : #private }
GtkImage >> getIconName: icon_name size: size [
	
	^ self ffiCall: #(void gtk_image_get_icon_name (self,
                         "const gchar **"void *icon_name,
                         "GtkIconSize *"void *size))
]

{ #category : #private }
GtkImage >> getPixbuf [

	^ self ffiCall: #(GdkPixbuf* gtk_image_get_pixbuf (self))
]

{ #category : #private }
GtkImage >> iconName [

	^ self gObjectGetString: 'icon-name'
]

{ #category : #private }
GtkImage >> iconSize [

	^ self gObjectGetInteger: 'icon-size'
]

{ #category : #private }
GtkImage >> imageType [

	^ self ffiCall: #(GtkImageType gtk_image_get_storage_type (self))
]

{ #category : #accessing }
GtkImage >> pixbuf: pixbuf [

	self ffiCall: #(void gtk_image_set_from_pixbuf (self, GdkPixbuf* pixbuf))
]

{ #category : #converting }
GtkImage >> setFromGdkPixbuf: pixbuf [

	^ self ffiCall: #(void gtk_image_set_from_pixbuf(self, GdkPixbuf *pixbuf))
]
