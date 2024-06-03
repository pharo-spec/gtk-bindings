Class {
	#name : 'GdkLibrary',
	#superclass : 'GObjectLibrary',
	#category : 'Gdk-Library',
	#package : 'Gdk',
	#tag : 'Library'
}

{ #category : 'accessing - platform' }
GdkLibrary >> unix64LibraryName [ 

	"It seems to come linked with libgtk-4 ? (in any case, I do not find it and it 
	 does not really matters)"
	self class isDebug ifTrue: [ ^ '/home/esteban/jhbuild/install/lib/libgtk-4.so' ]. 
	^ FFIUnix64LibraryFinder findAnyLibrary: #('libgtk-4.so' 'libgtk-4.so.1')
]

{ #category : 'accessing - platform' }
GdkLibrary >> win32LibraryName [

	^ 'libgdk-3-0.dll'
]
