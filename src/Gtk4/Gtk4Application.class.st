Class {
	#name : #Gtk4Application,
	#superclass : #G4Application,
	#traits : 'Gtk4TLibrary',
	#classTraits : 'Gtk4TLibrary classTrait',
	#instVars : [
		'applicationId',
		'runProcess'
	],
	#category : #Gtk4
}

{ #category : #private }
Gtk4Application class >> gtk_application_new: application_id flags: flags [

	self ffiCall: #(#Gtk4Application *gtk_application_new ( 
		const char* application_id, 
		"GApplicationFlags"int flags))
]

{ #category : #'instance creation' }
Gtk4Application class >> new [ 

	^ self error: 'Use #newId:flags:'
]

{ #category : #'instance creation' }
Gtk4Application class >> newId: anId [

	^ self newId: anId flags: 0

	
]

{ #category : #'instance creation' }
Gtk4Application class >> newId: anId flags: flags [

	^ (self gtk_application_new: anId flags: flags) 
		id: anId;
		initialize;
		yourself
]

{ #category : #initialization }
Gtk4Application >> id: anId [ 

	applicationId := anId
]

{ #category : #testing }
Gtk4Application >> isRunning [

	^ runProcess notNil 
		and: [ runProcess isTerminated not ]
]

{ #category : #running }
Gtk4Application >> run [
	
	runProcess := [
		| exitCode | 
		TFProcessLocalWorker worker: TFMainThreadRunner uniqueInstance.
		exitCode := self gRun.
		exitCode = 0 
			ifFalse: [ self error: ('Run loop exited with code {1}' format: { exitCode } ) ] ]
	forkAt: Processor lowIOPriority 
	named: applicationId
]
