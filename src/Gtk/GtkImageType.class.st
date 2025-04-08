"
Describes the image data representation used by a GtkImage. 

https://docs.gtk.org/gtk4/enum.ImageType.html
"
Class {
	#name : 'GtkImageType',
	#superclass : 'GEnumeration',
	#classVars : [
		'GTK_IMAGE_EMPTY',
		'GTK_IMAGE_GICON',
		'GTK_IMAGE_ICON_NAME',
		'GTK_IMAGE_PAINTABLE'
	],
	#category : 'Gtk-Misc',
	#package : 'Gtk',
	#tag : 'Misc'
}

{ #category : 'accessing enum' }
GtkImageType class >> GTK_IMAGE_EMPTY [
	"This method was automatically generated"
	^ GTK_IMAGE_EMPTY
]

{ #category : 'accessing enum' }
GtkImageType class >> GTK_IMAGE_GICON [
	"This method was automatically generated"
	^ GTK_IMAGE_GICON
]

{ #category : 'accessing enum' }
GtkImageType class >> GTK_IMAGE_ICON_NAME [
	"This method was automatically generated"
	^ GTK_IMAGE_ICON_NAME
]

{ #category : 'accessing enum' }
GtkImageType class >> GTK_IMAGE_PAINTABLE [
	"This method was automatically generated"
	^ GTK_IMAGE_PAINTABLE
]

{ #category : 'enum declaration' }
GtkImageType class >> enumDecl [
	"
	 self initializeEnumeration.
	 self rebuildEnumAccessors
	"

	^ #(
	GTK_IMAGE_EMPTY			0
	GTK_IMAGE_ICON_NAME 	1
	GTK_IMAGE_GICON 		2
	GTK_IMAGE_PAINTABLE 	3
	)
]
