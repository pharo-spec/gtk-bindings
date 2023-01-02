Class {
	#name : #GtkBaseTest,
	#superclass : #TestCase,
	#classVars : [
		'RemoteExecutionEnvironment'
	],
	#category : #'Gtk4-Tests-Base'
}

{ #category : #testing }
GtkBaseTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkBaseTest ]
]

{ #category : #private }
GtkBaseTest >> ensureRemoteExecutionEnvitonmentOn: aClass [
		
	RemoteExecutionEnvironment ifNotNil: [ ^ RemoteExecutionEnvironment ].

	^ (RemoteExecutionEnvironment := aClass new)
		id: 'GtkTestingRunner';
		onRunnerActivated: [ :aRunner | 
			aRunner runCommand: [
				GEngine ensureRunning. 
				true ] ];
		yourself
]

{ #category : #running }
GtkBaseTest >> executionEnvironment [

	"verify if class exists to not force a dependence"
	^ (self class environment classNamed: #RmRunnerExecutionEnvironment)
		ifNotNil: [ :aClass | self ensureRemoteExecutionEnvitonmentOn: aClass ]
		ifNil: [ CurrentExecutionEnvironment value ]
]

{ #category : #running }
GtkBaseTest >> runCase [

	GEngine ensureRunning.
	GRunLoop defer: [ 
		super runCase ]
]

{ #category : #running }
GtkBaseTest >> runCaseManaged [

	self executionEnvironment runTestCase: self
]
