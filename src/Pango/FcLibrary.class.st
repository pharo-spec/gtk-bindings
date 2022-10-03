Class {
	#name : #FcLibrary,
	#superclass : #FFILibrary,
	#category : #'Pango-FontConfig'
}

{ #category : #accessing }
FcLibrary class >> fcInit [

	^ self uniqueInstance fcInit
]

{ #category : #converting }
FcLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : #accessing }
FcLibrary >> fcInit [

	^ self ffiCall: #(FcBool FcInit())
]

{ #category : #'accessing platform' }
FcLibrary >> macLibraryName [

	^ GMacLibraryFinder findAnyLibrary: #('libfontconfig.1.dylib' 'libfontconfig.dylib')
]

{ #category : #converting }
FcLibrary >> runner [
	
	^ GObjectLibrary naturalRunner
]

{ #category : #'accessing platform' }
FcLibrary >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findLibrary: 'libfontconfig.so.1'
]
