Class {
	#name : #GdkLibrary,
	#superclass : #GtkLibrary,
	#category : #'Gdk-Base'
}

{ #category : #'accessing platform' }
GdkLibrary >> win32LibraryName [

	^ 'libgdk-3-0.dll'
]
