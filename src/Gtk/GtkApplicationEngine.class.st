Class {
	#name : 'GtkApplicationEngine',
	#superclass : 'GEngine',
	#traits : 'GtkTLibrary + TObservable',
	#classTraits : 'GtkTLibrary classTrait + TObservable classTrait',
	#instVars : [
		'#application',
		'#applicationClass',
		'#id',
		'#active => ObservableSlot',
		'#holdedApplication'
	],
	#category : 'Gtk-App-Experimental',
	#package : 'Gtk',
	#tag : 'App-Experimental'
}

{ #category : 'as yet unclassified' }
GtkApplicationEngine class >> defaultApplicationClass [
	
	^ GtkApplication
]

{ #category : 'as yet unclassified' }
GtkApplicationEngine class >> defaultApplicationId [
	
	^ 'org.pharo.PharoGtk'
]

{ #category : 'testing' }
GtkApplicationEngine class >> isAvailable [

	^ false
]

{ #category : 'api' }
GtkApplicationEngine >> application [

	^ application
]

{ #category : 'api' }
GtkApplicationEngine >> applicationClass [

	^ applicationClass ifNil: [ applicationClass := self class defaultApplicationClass ]
]

{ #category : 'api' }
GtkApplicationEngine >> applicationClass: anApplicationClass [

	applicationClass := anApplicationClass
]

{ #category : 'private - running' }
GtkApplicationEngine >> ensureApplication [

	application isNullOrNil ifFalse: [ ^ application ].

	application := self applicationClass 
		newId: self id 
		flags: GApplicationFlags G_APPLICATION_DEFAULT_FLAGS 
			| GApplicationFlags G_APPLICATION_CAN_OVERRIDE_APP_ID
			| GApplicationFlags G_APPLICATION_NON_UNIQUE.
			
	application register
		ifFalse: [ self error: 'I can''t register ', self id ].
	
	"this 'leaks', but since once started an application it cannot be destroyed unless you quit, 
	 better to formalise it ;)"
	application doNotAutoRelease.	
	
	^ application
]

{ #category : 'system startup' }
GtkApplicationEngine >> ensureRunLoop [

	^ GtkApplicationRunLoop new
		engine: self;
		yourself
]

{ #category : 'running' }
GtkApplicationEngine >> forkRun [
 
	logger trace.
	[ 
		self run.
	 	logger debug: 'g_application_run ended' ] 
	forkAt:  Processor highIOPriority
	named: 'GTK Event loop'
]

{ #category : 'private - gilworker' }
GtkApplicationEngine >> gilWorkerDetachPollFunctionAddress [

	^ ExternalAddress
		loadSymbol: 'pharo_gtk4_detaching_g_main_context_poll'
		from: 'PharoVMGTK4GIL'
]

{ #category : 'private' }
GtkApplicationEngine >> holdApplication [

	logger trace.
	logger debug: 'Release holded application'.
	holdedApplication := true.
	application hold
]

{ #category : 'api' }
GtkApplicationEngine >> id [

	^ id ifNil: [ id := self class defaultApplicationId ]
]

{ #category : 'api' }
GtkApplicationEngine >> id: aString [

	id := aString
]

{ #category : 'initialization' }
GtkApplicationEngine >> initialize [

	super initialize.
	self class initializeSlots: self.
	active := false.
	holdedApplication := false
]

{ #category : 'installing' }
GtkApplicationEngine >> install [

	logger trace.

	self isRunning ifTrue: [ self stop ].

	Current := self.
	
	self startEngineSupportsBeforeInitialization.
	self installGClasses.
	self ensureApplication.
	self maybeInstallGILWorkerDetachPollFunction.

	GApplicationStartAnnouncement emit.
	"defer in case we have a GIL"
	GMainThreadRunner uniqueInstance defer: [ 
		self startEngineSupports.
		application connectActivate: [ 
			runLoop running: true.
			self start ] ]
]

{ #category : 'private - running' }
GtkApplicationEngine >> installGClasses [

	TFProcessLocalWorker 
		use: GMainThreadRunner uniqueInstance
		during: [ 
			GMainThreadRunner uniqueInstance defer: [  
				(GTClass users flatCollect: #withAllSubclasses) 
					reject: [ :each | each isTrait or: [ each isAbstract ] ]
					thenDo: [ :each | each gInstall ] ] ]
]

{ #category : 'testing' }
GtkApplicationEngine >> isActive [

	^ active
]

{ #category : 'private' }
GtkApplicationEngine >> maybeInstallGILWorkerDetachPollFunction [
	| runner gPoll |

	logger trace.

	runner := GMainThreadRunner uniqueInstance.
	runner isGILWorker ifFalse: [ ^ self ].

	logger debug: 'Preparing as GIL hybrid detach policy.'.
	
	runner callbackDetachPolicy: #hybrid.

	gPoll := ExternalAddress loadSymbol: 'g_poll' from: GLibLibrary.
	gPoll isNull ifTrue: [ self error: 'Cannot resolve g_poll from GLibLibrary' ].
	
	self setGILWorkerGMainPollFunction: gPoll.
	GMainContext default setPollFunction: self gilWorkerDetachPollFunctionAddress
]

{ #category : 'private' }
GtkApplicationEngine >> maybeReleaseHoldedApplication [

	logger trace.

	(holdedApplication and: [ windowRegistry isEmpty ]) ifFalse: [ ^ self ].

	logger debug: 'Release holded application'.
	application release.
	holdedApplication := false
]

{ #category : 'accessing' }
GtkApplicationEngine >> naturalRunner [

	^ runLoop naturalRunner
]

{ #category : 'registry' }
GtkApplicationEngine >> registerWindow: gtkWindow [
	
	logger trace: gtkWindow.
	gtkWindow isWindow ifTrue: [ 
		application addWindow: gtkWindow ].
	super registerWindow: gtkWindow
]

{ #category : 'running' }
GtkApplicationEngine >> run [
 
	runLoop running: true.
	^ [ application run ]
		ensure: [
			runLoop running: false.
			self stop ]
]

{ #category : 'private - gilworker' }
GtkApplicationEngine >> setGILWorkerGMainPollFunction: aFunctionAddress [

	^ self
		ffiCall: #(void pharo_gtk4_set_g_poll_function (void *aFunctionAddress))
		module: 'PharoVMGTK4GIL'
]

{ #category : 'private - running' }
GtkApplicationEngine >> start [
	
	logger trace: active.
	active ifTrue: [ ^ self ].
	"this will trigger whenActivatedDo:"
	active := true.
	"if not windows registered on activation phase, we still want to keep it. 
	 So we keep it always (it will not hurt)"
	self holdApplication
]

{ #category : 'private - running' }
GtkApplicationEngine >> startEngineSupports [
	
	GtkEngineSupport allAvailableForExecuteAfterInitialization 
		do: [ :each | each start ]
]

{ #category : 'private - running' }
GtkApplicationEngine >> startEngineSupportsBeforeInitialization [
	
	GtkEngineSupport allAvailableForExecuteBeforeInitialization 
		do: [ :each | each start ]
]

{ #category : 'private - running' }
GtkApplicationEngine >> stop [

	logger trace: active.

	active ifFalse: [ ^ self ].
	active := false
]

{ #category : 'registry' }
GtkApplicationEngine >> unregisterWindow: aWindow [

	super unregisterWindow: aWindow.
	self maybeReleaseHoldedApplication
]

{ #category : 'api - events' }
GtkApplicationEngine >> whenActivatedDo: aBlock [

	self 
		property: #active 
		whenChangedDo: [ :aBoolean |
			aBoolean ifTrue: [ aBlock cull: self application ] ]
]
