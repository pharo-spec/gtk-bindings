Class {
	#name : #GtkEngine,
	#superclass : #Object,
	#traits : 'TGtkLibrary',
	#classTraits : 'TGtkLibrary classTrait',
	#instVars : [
		'runLoop',
		'windowRegistry',
		'shutdownRegistry',
		'resourceManager'
	],
	#classVars : [
		'Current'
	],
	#pools : [
		'GtkTypes'
	],
	#category : #'Gtk-Base'
}

{ #category : #accessing }
GtkEngine class >> current [
	^ Current
]

{ #category : #accessing }
GtkEngine class >> ensureRunning [

	self isRunning ifTrue: [ ^ self ].
	"self ensureVersion."
	self new run.

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
GtkEngine class >> isRunning [ 
	
	^ self current notNil 
		and: [ self current isRunning ]
]

{ #category : #accessing }
GtkEngine class >> requiredGtkVersion [
		
	^ '3.22.0'
]

{ #category : #private }
GtkEngine class >> reset [
	<script>

	Current ifNil: [ ^ self ].
	Current stop.
	Current := nil.
	self flag: #TODO. "I'm placing this here, not sure is the right place but for now it works"
	GtkDestroySignal reset.
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
		GtkDestroySignal reset ].
	
	Current ifNil: [ ^ self ].
	Current startUp: resuming
]

{ #category : #'system startup' }
GtkEngine >> ensureRunLoop [
	| runLoopClass |
	
	runLoopClass := GtkRunLoop bestStrategyClass.
	(runLoop notNil 
		and: [ runLoop class = runLoopClass ])
		ifTrue: [ ^ self ].
		
	runLoopClass install.
	^ GtkRunLoop current
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

{ #category : #initialization }
GtkEngine >> initialize [

	super initialize.
	windowRegistry := Set new.
	shutdownRegistry := Set new.
	runLoop := self ensureRunLoop
]

{ #category : #testing }
GtkEngine >> isRunning [ 

	^ runLoop isRunning
]

{ #category : #testing }
GtkEngine >> isWindowRegistered: aWindow [ 

	^ windowRegistry includes: aWindow
]

{ #category : #registry }
GtkEngine >> registerShutdown: anObject [
	"Some objects need special shutdown action *before* going out. 
	 (This is the case, for example, of the GtkFormView used in OSGtkFormRenderer).
	 You can subscribe those objects here, and they will be called *before* shutting down 
	 the run loop.
	 BEWARE: object needs to implement #prepareForShutdown methiod"

	shutdownRegistry add: anObject
]

{ #category : #registry }
GtkEngine >> registerWindow: aWindow [

	windowRegistry add: aWindow.
	GtkWindowRegisterSignal emitWidget: aWindow	
]

{ #category : #accessing }
GtkEngine >> resourceManager [

	^ GtkExternalResourceManager uniqueInstance
]

{ #category : #running }
GtkEngine >> run [
	Current ifNotNil: [ Current stop ].
	Current := nil.
	self start.
	Current := self.
	
]

{ #category : #'system startup' }
GtkEngine >> shutDown: quitting [
	
	self isRunning ifFalse: [ ^ self ].
	quitting ifTrue: [
		"process shutdown *before* shutting down runloop, because actions may need 
		 some gtk side actions"
		runLoop defer: [ 
			shutdownRegistry do: [ :each | each prepareToShutdown ] ] ].
	runLoop stop
]

{ #category : #'private running' }
GtkEngine >> start [ 
	self isRunning ifTrue: [ self stop ].

	self initGtk3.
	GtkApplicationStartSignal emit.
	runLoop start
]

{ #category : #'system startup' }
GtkEngine >> startUp: resuming [

	resuming ifTrue: [ 
		"This should not be reached anyway, since Current is niled on class side startUp"
		^ self ]. 
	runLoop start
]

{ #category : #'private running' }
GtkEngine >> stop [
	self isRunning ifFalse: [ ^ self ].
	runLoop stop
]

{ #category : #running }
GtkEngine >> suspendRunLoopWhile: aBlock [
	self stop.
	^ aBlock ensure: [ self start ]
]

{ #category : #registry }
GtkEngine >> unregisterWindow: aWindow [

	GtkWindowUnregisterSignal emitWidget: aWindow.
	windowRegistry 
		remove: aWindow 
		ifAbsent: [ ]
]

{ #category : #accessing }
GtkEngine >> windowByHandle: aHandle [ 
	| numberHandle |

	numberHandle := aHandle asInteger.
	^ windowRegistry 
		detect: [ :each | each getHandle asInteger = numberHandle ] 
		ifNone: [ nil ]
]
