Class {
	#name : 'GdkPixbufLibrary',
	#superclass : 'GObjectLibrary',
	#category : 'Gdk-Pixbuf',
	#package : 'Gdk',
	#tag : 'Pixbuf'
}

{ #category : 'accessing platform' }
GdkPixbufLibrary >> win32LibraryName [

	^ 'libgdk_pixbuf-2.0-0.dll'
]
