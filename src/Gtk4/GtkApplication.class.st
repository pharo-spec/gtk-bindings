Class {
	#name : #GtkApplication,
	#superclass : #GApplication,
	#traits : 'GtkTLibrary',
	#classTraits : 'GtkTLibrary classTrait',
	#instVars : [
		'applicationId',
		'runProcess'
	],
	#category : #Gtk4
}

{ #category : #private }
GtkApplication class >> finalize: handle [

	self objectRefSink: handle.
	^ super finalize: handle
]

{ #category : #private }
GtkApplication class >> gtk_application_new: application_id flags: flags [

	self ffiCall: #(#GtkApplication *gtk_application_new ( 
		const char* application_id, 
		"GApplicationFlags"int flags))
]

{ #category : #'instance creation' }
GtkApplication class >> new [ 

	^ self error: 'Use #newId:flags:'
]

{ #category : #'instance creation' }
GtkApplication class >> newId: anId [

	^ self newId: anId flags: 0

	
]

{ #category : #'instance creation' }
GtkApplication class >> newId: anId flags: flags [

	^ (self gtk_application_new: anId flags: flags) 
		id: anId;
		initialize;
		yourself
]

{ #category : #private }
GtkApplication class >> objectRefSink: handle [

	^ self ffiCall: #(void *g_object_ref_sink (void* handle))
]

{ #category : #initialization }
GtkApplication >> id: anId [ 

	applicationId := anId
]

{ #category : #testing }
GtkApplication >> isRunning [

	^ runProcess notNil 
		and: [ runProcess isTerminated not ]
]

{ #category : #running }
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