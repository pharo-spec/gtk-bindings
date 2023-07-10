Class {
	#name : #GdkLibrary,
	#superclass : #GObjectLibrary,
	#category : #'Gdk-Base'
}

{ #category : #'accessing platform' }
GdkLibrary >> unix64LibraryName [ 

	self class isDebug ifTrue: [ ^ '/home/esteban/jhbuild/install/lib/libgdk-3.so' ]. 
	^ FFIUnix64LibraryFinder findAnyLibrary: #('libgdk-3.so' 'libgdk-3.so.0')
]

{ #category : #'accessing platform' }
GdkLibrary >> win32LibraryName [

	^ 'libgdk-3-0.dll'
]
