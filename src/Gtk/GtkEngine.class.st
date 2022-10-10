Class {
	#name : #GtkEngine,
	#superclass : #GEngine,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'initAction'
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

	^ false "forced to false to use Gtk4Engine"
]

{ #category : #accessing }
GtkEngine class >> requiredGtkVersion [
		
	^ '3.22.0'
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

{ #category : #'system startup' }
GtkEngine >> ensureRunLoop [
	| runLoopClass |
	
	runLoopClass := GtkRunLoop bestStrategyClass.
	(runLoop notNil 
		and: [ runLoop class = runLoopClass ])
		ifTrue: [ ^ runLoop ].
		
	^ runLoopClass new
]

{ #category : #private }
GtkEngine >> initArgC: argc argV: argv [

	^ self ffiCall: #(void gtk_init ("int *"void *argc, "char ***"void *argv))
]

{ #category : #private }
GtkEngine >> initGtk3 [
	"Initialize Gtk3"

	self 
		initArgC: ExternalAddress null 
		argV: ExternalAddress null
]

{ #category : #accessing }
GtkEngine >> naturalRunner [

	^ runLoop naturalRunner
]

{ #category : #'private running' }
GtkEngine >> start [ 
	self isRunning ifTrue: [ self stop ].

	self initGtk3.
	GApplicationStartAnnouncement emit.
	initAction ifNotNil: [ initAction cull: self ].
	runLoop start
]

{ #category : #'private running' }
GtkEngine >> stop [
	self isRunning ifFalse: [ ^ self ].
	runLoop stop
]

{ #category : #events }
GtkEngine >> whenInitializedDo: aBlock [

	initAction := aBlock
]
