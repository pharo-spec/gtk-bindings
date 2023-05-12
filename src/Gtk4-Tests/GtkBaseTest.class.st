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

{ #category : #initialization }
GtkBaseTest class >> resetTestEnvironment [
	<script>

	RemoteExecutionEnvironment := nil
]

{ #category : #private }
GtkBaseTest >> ensureRemoteExecutionEnvironmentOn: aClass [
		
	^ RemoteExecutionEnvironment ifNil: [
		RemoteExecutionEnvironment := self newRemoteExecutionEnronmentWith: aClass ]
]

{ #category : #running }
GtkBaseTest >> executionEnvironment [

	"verify if class exists to not force a dependence"
	^ (self class environment classNamed: #RmRunnerExecutionEnvironment)
		ifNotNil: [ :aClass | self ensureRemoteExecutionEnvironmentOn: aClass ]
		ifNil: [ CurrentExecutionEnvironment value ]
]

{ #category : #private }
GtkBaseTest >> newRemoteExecutionEnronmentWith: aClass [

	^ aClass new
		runnerId: 'GtkTestRunner';
		onRunnerActivated: [ :aRunner | 
			aRunner runCommand: [
				GEngine ensureRunning. 
				true ] ];
		yourself
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
