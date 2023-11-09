Class {
	#name : 'GObjectLibrary',
	#superclass : 'FFILibrary',
	#instVars : [
		'runner'
	],
	#classVars : [
		'Debug'
	],
	#pools : [
		'GObjectTypes'
	],
	#category : 'GObject-Base',
	#package : 'GObject',
	#tag : 'Base'
}

{ #category : 'accessing' }
GObjectLibrary class >> beForDebug [
	<script>
	
	Debug := true
]

{ #category : 'accessing' }
GObjectLibrary class >> beForProduction [
	<script>

	Debug := false
]

{ #category : 'testing' }
GObjectLibrary class >> isDebug [ 

	^ Debug ifNil: [ Debug := false ]
]

{ #category : 'accessing' }
GObjectLibrary class >> naturalRunner [
	"Answer the 'natural' FFI client to run Gtk"
	
	^ GEngine ensureEngine naturalRunner
]

{ #category : 'accessing' }
GObjectLibrary >> calloutAPIClass [ 

	^ TFCalloutAPI
]

{ #category : 'accessing platform' }
GObjectLibrary >> macLibraryName [
	"In linux and mac this is not really important, because once you load the main 
	 library, you will find also the symbols on dependent librarues. 
	 So I will point directly to the gtk4 library, just to simplify"

	^ GMacLibraryFinder findLibrary: 'libgtk-4.dylib'
]

{ #category : 'accessing' }
GObjectLibrary >> runner [
	
	^ TFProcessLocalWorker new 
		defaultWorker: self class naturalRunner;
		yourself
]

{ #category : 'accessing platform' }
GObjectLibrary >> unix64LibraryName [ 

	self class isDebug ifTrue: [ ^ '/home/esteban/jhbuild/install/lib/libgobject-2.0.so' ]. 
	^ FFIUnix64LibraryFinder findLibrary: 'libgobject-2.0.so'
]

{ #category : 'accessing platform' }
GObjectLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findLibrary: 'libgobject-2.0-0.dll'
]
