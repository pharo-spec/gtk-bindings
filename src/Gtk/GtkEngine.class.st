Class {
	#name : #GtkEngine,
	#superclass : #GEngine,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'initAction',
		'application'
	],
	#category : #'Gtk-Base'
}

{ #category : #accessing }
GtkEngine class >> current [
	^ Current
]

{ #category : #accessing }
GtkEngine class >> ensureVersion [
	"Ensure the minimal version is installed"
	| version |
	
	version := self requiredGtkVersion.
	(GtkLibrary uniqueInstance matchesVersion: version) ifFalse: [ 
		self error: ('Gtk3 installed version ({1}) is older than the minimum required ({2})' 
			format: { 
				GtkLibrary uniqueInstance version. 
				version }) ]
]

{ #category : #'class initialization' }
GtkEngine class >> initialize [

	SessionManager default registerSystemClassNamed: self name
]

{ #category : #testing }
GtkEngine class >> isAvailable [

	^ true
]

{ #category : #accessing }
GtkEngine class >> requiredGtkVersion [
		
	^ '4.0.0'
]

{ #category : #'system startup' }
GtkEngine class >> shutDown: quitting [
	"ensure Gtk3 is stop when shutting down"

	Current ifNil: [ ^ self ].
	Current shutDown: quitting.
	"WARNING: Do not NIL Current! This is needed to keep track of the open windows (otherwise 
	 they will be closed/will crash/will put you in a world of suffering."
]

{ #category : #'system startup' }
GtkEngine class >> startUp: resuming [
	
	resuming ifTrue: [ 
		Current := nil.
		self flag: #TODO. "I'm placing this here, not sure is the right place but for now it works"
		GDestroyAnnouncement reset ].
	
	Current ifNil: [ ^ self ].
	Current startUp: resuming
]

{ #category : #'private - running' }
GtkEngine >> ensureApplication [

	self hasValidApplication ifTrue: [ ^ application ].

	application := GtkApplication
		newId: 'org.pharo.Gtk4Application'
		flags: GApplicationFlags G_APPLICATION_NON_UNIQUE.
	application register.
	^ application
]

{ #category : #'system startup' }
GtkEngine >> ensureRunLoop [

	^ Gtk4RunLoop new
]

{ #category : #'private - testing' }
GtkEngine >> hasValidApplication [
	
	^ application notNil 
		and: [ application isValidHandle ]
]

{ #category : #accessing }
GtkEngine >> naturalRunner [

	^ runLoop naturalRunner
]

{ #category : #'private - running' }
GtkEngine >> start [ 

	self isRunning ifTrue: [ self stop ].
	
	self ensureApplication.
	GApplicationStartAnnouncement emit.
	initAction ifNotNil: [ initAction cull: self ].
	runLoop start
]

{ #category : #'private - running' }
GtkEngine >> stop [

	self isRunning ifFalse: [ ^ self ].
	runLoop stop
]

{ #category : #events }
GtkEngine >> whenInitializedDo: aBlock [

	initAction := aBlock
]
