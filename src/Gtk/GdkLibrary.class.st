Class {
	#name : #GdkLibrary,
	#superclass : #GtkLibrary,
	#category : #'Gtk-Base'
}

{ #category : #'accessing platform' }
GdkLibrary >> win32LibraryName [

	^ 'libgdk-3-0.dll'
]
