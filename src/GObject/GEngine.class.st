Class {
	#name : 'GEngine',
	#superclass : 'Object',
	#instVars : [
		'runLoop',
		'windowRegistry',
		'shutdownRegistry'
	],
	#classVars : [
		'Current'
	],
	#pools : [
		'GtkTypes'
	],
	#category : 'GObject-Base',
	#package : 'GObject',
	#tag : 'Base'
}

{ #category : 'private' }
GEngine class >> availableEngineClass [

	^ GEngine allSubclasses detect: [ :each | each isAvailable ]
]

{ #category : 'accessing' }
GEngine class >> current [
	^ Current
]

{ #category : 'accessing' }
GEngine class >> ensureEngine [

	self isRunning ifTrue: [ ^ self current ].
	"self ensureVersion."
	^ self availableEngineClass new
]

{ #category : 'accessing' }
GEngine class >> ensureRunning [

	"already running"
	self isRunning ifTrue: [ ^ self current ].
	"already instance but not running"
	self current ifNotNil: [ ^ self current run ].
	"we need to instantiate and run"
	^ self ensureEngine run
]

{ #category : 'testing' }
GEngine class >> isAvailable [

	^ false
]

{ #category : 'testing' }
GEngine class >> isRunning [ 
	
	^ self current notNil 
		and: [ self current isRunning ]
]

{ #category : 'private' }
GEngine class >> reset [
	<script>

	Current ifNil: [ ^ self ].
	Current stop.
	Current := nil.
	self flag: #TODO. "I'm placing this here, not sure is the right place but for now it works"
	GDestroyAnnouncement reset.
]

{ #category : 'system startup' }
GEngine class >> shutDown: quitting [
	"ensure Gtk3 is stop when shutting down"

	Current ifNil: [ ^ self ].
	Current shutDown: quitting.
	"WARNING: Do not NIL Current! This is needed to keep track of the open windows (otherwise 
	 they will be closed/will crash/will put you in a world of suffering."
]

{ #category : 'system startup' }
GEngine class >> startUp: resuming [
	
	resuming ifTrue: [ 
		Current := nil.
		self flag: #TODO. "I'm placing this here, not sure is the right place but for now it works"
		GDestroyAnnouncement reset ].
	
	Current ifNil: [ ^ self ].
	Current startUp: resuming
]

{ #category : 'system startup' }
GEngine >> ensureRunLoop [

	self subclassResponsibility
]

{ #category : 'initialization' }
GEngine >> initialize [

	super initialize.
	windowRegistry := Set new.
	shutdownRegistry := Set new.
	runLoop := self ensureRunLoop
]

{ #category : 'testing' }
GEngine >> isRunning [ 

	^ runLoop isRunning
]

{ #category : 'testing' }
GEngine >> isWindowRegistered: aWindow [ 

	^ windowRegistry includes: aWindow
]

{ #category : 'accessing' }
GEngine >> naturalRunner [

	^ self subclassResponsibility
]

{ #category : 'registry' }
GEngine >> registerShutdown: anObject [
	"Some objects need special shutdown action *before* going out. 
	 (This is the case, for example, of the GtkFormView used in OSGtkFormRenderer).
	 You can subscribe those objects here, and they will be called *before* shutting down 
	 the run loop.
	 BEWARE: object needs to implement #prepareForShutdown methiod"

	shutdownRegistry add: anObject
]

{ #category : 'registry' }
GEngine >> registerWindow: aWindow [

	windowRegistry add: aWindow.
	GWindowRegisterAnnouncement emitWidget: aWindow	
]

{ #category : 'accessing' }
GEngine >> resourceManager [

	^ GExternalResourceManager uniqueInstance
]

{ #category : 'running' }
GEngine >> run [
	Current ifNotNil: [ Current stop ].
	Current := nil.
	self start.
	Current := self.
	
]

{ #category : 'accessing' }
GEngine >> runLoop [

	^ runLoop
]

{ #category : 'system startup' }
GEngine >> shutDown: quitting [
	
	self isRunning ifFalse: [ ^ self ].

	quitting ifTrue: [
		"process shutdown *before* shutting down runloop, because actions may need 
		 some gtk side actions"
		runLoop defer: [ 
			shutdownRegistry do: [ :each | each prepareToShutdown ] ] ].
	runLoop stop
]

{ #category : 'private running' }
GEngine >> start [ 

	self subclassResponsibility
]

{ #category : 'system startup' }
GEngine >> startUp: resuming [

	resuming ifTrue: [ 
		"This should not be reached anyway, since Current is niled on class side startUp"
		^ self ]. 
	runLoop start
]

{ #category : 'private running' }
GEngine >> stop [
	
	self subclassResponsibility
]

{ #category : 'running' }
GEngine >> suspendRunLoopWhile: aBlock [
	self stop.
	^ aBlock ensure: [ self start ]
]

{ #category : 'registry' }
GEngine >> unregisterWindow: aWindow [

	GWindowUnregisterAnnouncement emitWidget: aWindow.
	windowRegistry 
		remove: aWindow 
		ifAbsent: [ ].
		
	"prevent closed windows leaking instances."	
	windowRegistry := windowRegistry reject: [ :each | each getHandle isNull ].
]

{ #category : 'accessing' }
GEngine >> windowByHandle: aHandle [ 
	| numberHandle |

	numberHandle := aHandle asInteger.
	^ windowRegistry 
		detect: [ :each | each getHandle asInteger = numberHandle ] 
		ifNone: [ nil ]
]
