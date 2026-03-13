Class {
	#name : 'GtkApplicationEngine',
	#superclass : 'GEngine',
	#traits : 'GtkTLibrary + TObservable',
	#classTraits : 'GtkTLibrary classTrait + TObservable classTrait',
	#instVars : [
		'#application',
		'#applicationClass',
		'#id',
		'#active => ObservableSlot'
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

	application ifNotNil: [ ^ application ].

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
	active := false
]

{ #category : 'running' }
GtkApplicationEngine >> install [

	self isRunning ifTrue: [ self stop ].

	Current := self.
	
	self startEngineSupportsBeforeInitialization.
	self installGClasses.
	self ensureApplication.

	GApplicationStartAnnouncement emit.
	self startEngineSupports.
	application  connectActivate: [ 
		"this will trigger whenActivatedDo:"
		active := true ]
]

{ #category : 'private - running' }
GtkApplicationEngine >> installGClasses [

	TFProcessLocalWorker 
		use: TFMainThreadRunner uniqueInstance
		during: [ 
			(GTClass users flatCollect: #withAllSubclasses) 
				reject: [ :each | each isTrait or: [ each isAbstract ] ]
				thenDo: [ :each | each gInstall ] ]
]

{ #category : 'testing' }
GtkApplicationEngine >> isActive [

	^ active
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
 
	self start.
	application run
]

{ #category : 'private - running' }
GtkApplicationEngine >> start [
	
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

	"what to do here?"
]

{ #category : 'registry' }
GtkApplicationEngine >> unregisterWindow: aWindow [

	super unregisterWindow: aWindow
]

{ #category : 'api - events' }
GtkApplicationEngine >> whenActivatedDo: aBlock [

	self 
		property: #active 
		whenChangedDo: [ :aBoolean |
			aBoolean ifTrue: [ aBlock cull: self application ] ]
]
