Class {
	#name : #GdkLibrary,
	#superclass : #GObjectLibrary,
	#category : #'Gdk-Base'
}

{ #category : #'accessing platform' }
GdkLibrary >> win32LibraryName [

	^ 'libgdk-3-0.dll'
]
