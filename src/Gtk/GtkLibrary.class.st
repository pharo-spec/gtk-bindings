Class {
	#name : #GtkLibrary,
	#superclass : #GObjectLibrary,
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Base'
}

{ #category : #private }
GtkLibrary >> getMajorVersion [

	^ self ffiCall: #(guint gtk_get_major_version (void))
]

{ #category : #private }
GtkLibrary >> getMicroVersion [

	^ self ffiCall: #(guint gtk_get_micro_version (void))
]

{ #category : #private }
GtkLibrary >> getMinorVersion [

	^ self ffiCall: #(guint gtk_get_minor_version (void))
]

{ #category : #'accessing platform' }
GtkLibrary >> macLibraryName [

	^ GMacLibraryFinder findAnyLibrary: #('libgtk-3.0.dylib' 'libgtk-3.dylib')
]

{ #category : #accessing }
GtkLibrary >> matchVersion: aString ifTrue: trueBlock ifFalse: falseBlock [ 
	
	^ (self matchesVersion: aString) 
		ifTrue: trueBlock
		ifFalse: falseBlock
]

{ #category : #private }
GtkLibrary >> matchVersionMajor: required_major minor: required_minor micro: required_micro [ 
	
	"I use void * to prevent the FFI backend to free the string"
	^ self ffiCall: #("char *"void *gtk_check_version (
		guint required_major,
		guint required_minor,
		guint required_micro))
]

{ #category : #testing }
GtkLibrary >> matchesVersion: aString [
	| version match |
	
	version := (aString substrings: '.') collect: #asNumber.
	match := self 
		matchVersionMajor: version first
		minor: version second
		micro: version third.
	
	"if null, everything is ok"
	^ match isNil or: [ match isNull ]
]

{ #category : #'accessing platform' }
GtkLibrary >> unix64LibraryName [ 

	self class isDebug ifTrue: [ ^ '/home/esteban/jhbuild/install/lib/libgtk-3.so' ]. 
	^ FFIUnix64LibraryFinder findAnyLibrary: #('libgtk-3.so' 'libgtk-3.so.0')
]

{ #category : #accessing }
GtkLibrary >> version [

	^ '{1}.{2}.{3}' format: { 
		self getMajorVersion. 
		self getMinorVersion.
		self getMicroVersion }
]

{ #category : #'accessing platform' }
GtkLibrary >> win32LibraryName [
	
	^ 'libgtk-3-0.dll'
]
