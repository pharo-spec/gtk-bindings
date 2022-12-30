Class {
	#name : #GdkLibrary,
	#superclass : #GObjectLibrary,
	#category : #'Gdk-Base'
}

{ #category : #'accessing platform' }
GdkLibrary >> unix64LibraryName [ 

	self class isDebug ifTrue: [ ^ '/home/esteban/jhbuild/install/lib/libgdk-3.so' ]. 
	^ FFIUnix64LibraryFinder findLibrary: 'libgdk-3.so'
]

{ #category : #'accessing platform' }
GdkLibrary >> win32LibraryName [

	^ 'libgdk-3-0.dll'
]
