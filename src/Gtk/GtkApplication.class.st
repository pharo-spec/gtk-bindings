Class {
	#name : 'GtkApplication',
	#superclass : 'GApplication',
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'applicationId',
		'runProcess'
	],
	#category : 'Gtk-Application',
	#package : 'Gtk',
	#tag : 'Application'
}

{ #category : 'accessing' }
GtkApplication class >> activeClass [

	^ (self subclasses select: [ :each | each canBeActivated ])
		ifNotEmpty: [ :sc | sc first ]
		ifEmpty: [ self ]
]

{ #category : 'private' }
GtkApplication class >> canBeActivated [

	^ true
]

{ #category : 'private' }
GtkApplication class >> finalize: handle [

	self objectRefSink: handle.
	^ super finalize: handle
]

{ #category : 'private' }
GtkApplication class >> gtk_application_new: application_id flags: flags [

	self ffiCall: #(#GtkApplication *gtk_application_new ( 
		const char* application_id, 
		GApplicationFlags flags))
]

{ #category : 'instance creation' }
GtkApplication class >> new [ 

	^ self error: 'Use #newId:flags:'
]

{ #category : 'instance creation' }
GtkApplication class >> newId: anId [

	^ self newId: anId flags: G_APPLICATION_DEFAULT_FLAGS
	
]

{ #category : 'instance creation' }
GtkApplication class >> newId: anId flags: flags [

	^ (self gtk_application_new: anId flags: flags) 
		id: anId;
		initialize;
		yourself
]

{ #category : 'private' }
GtkApplication class >> objectRefSink: handle [

	^ self ffiCall: #(void *g_object_ref_sink (void* handle))
]

{ #category : 'accessing' }
GtkApplication >> activeWindow [

	^ self
		gObjectGetHandle: 'active-window'
		as: GtkWindow
]

{ #category : 'initialization' }
GtkApplication >> id: anId [ 

	applicationId := anId
]

{ #category : 'testing' }
GtkApplication >> isRunning [

	^ runProcess notNil 
		and: [ runProcess isTerminated not ]
]

{ #category : 'running' }
GtkApplication >> run [
	
	runProcess := [
		| exitCode | 
		TFProcessLocalWorker worker: TFMainThreadRunner uniqueInstance.
		exitCode := self gRun.
		"exitCode = 0 
			ifFalse: [ self error: ('Run loop exited with code {1}' format: { exitCode } ) ]" ]
	forkAt: Processor lowIOPriority 
	named: applicationId
]
