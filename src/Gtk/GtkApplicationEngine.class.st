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
			
	application register.
	
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

{ #category : 'testing' }
GtkApplicationEngine >> isActive [

	^ active
]

{ #category : 'accessing' }
GtkApplicationEngine >> naturalRunner [

	^ runLoop naturalRunner
]

{ #category : 'running' }
GtkApplicationEngine >> run [

	Current := self
]

{ #category : 'private - running' }
GtkApplicationEngine >> start [

	application := self ensureApplication.
	GApplicationStartAnnouncement emit.
	self startEngineSupports.			
			
	application  connectActivate: [ 
		active := true ].
]

{ #category : 'private - running' }
GtkApplicationEngine >> startEngineSupports [
	
	GtkEngineSupport allAvailable do: [ :each | each start ]
]

{ #category : 'private - running' }
GtkApplicationEngine >> stop [

	"what to do here?"
]

{ #category : 'api - events' }
GtkApplicationEngine >> whenActivatedDo: aBlock [

	self 
		property: #active 
		whenChangedDo: [ :aBoolean |
			aBoolean ifTrue: [ aBlock cull: self application ] ]
]
