Class {
	#name : #GdkPixbufLibrary,
	#superclass : #GObjectLibrary,
	#category : #'Gdk-Pixbuf'
}

{ #category : #'accessing platform' }
GdkPixbufLibrary >> win32LibraryName [

	^ 'libgdk_pixbuf-2.0-0.dll'
]
