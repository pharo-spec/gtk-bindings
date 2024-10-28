Class {
	#name : 'GMacLibraryFinder',
	#superclass : 'FFIMacLibraryFinder',
	#category : 'GObject-Base',
	#package : 'GObject',
	#tag : 'Base'
}

{ #category : 'testing' }
GMacLibraryFinder class >> isDebug [ 

	^ GObjectLibrary isDebug
]

{ #category : 'accessing' }
GMacLibraryFinder >> basePaths [
	
	^ { self gtkBasePath }, super basePaths
	
]

{ #category : 'accessing' }
GMacLibraryFinder >> gtkBasePath [

	^  self isDebug 
		ifTrue: [ '/Users/gtk3/gtk/inst/lib' ]
		ifFalse: [ (FileLocator vmBinary parent parent / 'Resources' / 'gtk3' / 'lib') fullName ]
]

{ #category : 'initialization' }
GMacLibraryFinder >> initialize [

	super initialize.
	
]

{ #category : 'testing' }
GMacLibraryFinder >> isDebug [

	^  self class isDebug
]
