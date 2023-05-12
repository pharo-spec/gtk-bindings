Class {
	#name : #GLibIOLibrary,
	#superclass : #GObjectLibrary,
	#category : #'GLib-IO-Base'
}

{ #category : #'accessing platform' }
GLibIOLibrary >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findLibrary: 'libgio-2.0.so'
]

{ #category : #'accessing platform' }
GLibIOLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findLibrary: 'libgio-2.0-0.dll'
]