Class {
	#name : #GMacLibraryFinder,
	#superclass : #FFIMacLibraryFinder,
	#classVars : [
		'Debug'
	],
	#category : #'GObject-Base'
}

{ #category : #accessing }
GMacLibraryFinder class >> beForDebug [
	<script>
	
	Debug := true
]

{ #category : #accessing }
GMacLibraryFinder class >> beForProduction [
	<script>

	Debug := false
]

{ #category : #testing }
GMacLibraryFinder class >> isDebug [ 

	^ Debug ifNil: [ Debug := false ]
]

{ #category : #accessing }
GMacLibraryFinder >> basePaths [
	
	^ { self gtkBasePath }, super basePaths
	
]

{ #category : #accessing }
GMacLibraryFinder >> gtkBasePath [

	^  self isDebug 
		ifTrue: [ '/Users/gtk3/gtk/inst/lib' ]
		ifFalse: [ (FileLocator vmBinary parent parent / 'Resources' / 'gtk3' / 'lib') fullName ]
]

{ #category : #initialization }
GMacLibraryFinder >> initialize [

	super initialize.
	
]

{ #category : #testing }
GMacLibraryFinder >> isDebug [

	^  self class isDebug
]
