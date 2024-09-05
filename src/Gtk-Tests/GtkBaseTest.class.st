Class {
	#name : 'GtkBaseTest',
	#superclass : 'TestCase',
	#classVars : [
		'RemoteExecutionEnvironment'
	],
	#category : 'Gtk-Tests-Base',
	#package : 'Gtk-Tests',
	#tag : 'Base'
}

{ #category : 'testing' }
GtkBaseTest class >> isAbstract [

	^ super isAbstract or: [ self = GtkBaseTest ]
]

{ #category : 'initialization' }
GtkBaseTest class >> resetTestEnvironment [
	<script>

	RemoteExecutionEnvironment := nil
]

{ #category : 'private' }
GtkBaseTest >> ensureRemoteExecutionEnvironment [
		
	^ RemoteExecutionEnvironment ifNil: [
		RemoteExecutionEnvironment := self newRemoteExecutionEnronment ]
]

{ #category : 'running' }
GtkBaseTest >> executionEnvironment [

	"verify if class exists to not force a dependence"
	
	^ self useRemoteExecutionEnvironment
		ifTrue: [ self ensureRemoteExecutionEnvironment ]
		ifFalse: [ super executionEnvironment ]
]

{ #category : 'private' }
GtkBaseTest >> newRemoteExecutionEnronment [

	^ (self class environment at: #RmRunnerExecutionEnvironment) new
		runnerId: 'GtkTestRunner';
		onRunnerActivated: [ :aRunner | 
			aRunner runCommand: [
				GEngine ensureRunning. 
				true ] ];
		yourself
]

{ #category : 'running' }
GtkBaseTest >> runCase [

	GEngine ensureRunning.
	GRunLoop defer: [ 
		super runCase ]
]

{ #category : 'running' }
GtkBaseTest >> runCaseManaged [

	self executionEnvironment runTestCase: self
]

{ #category : 'private' }
GtkBaseTest >> useRemoteExecutionEnvironment [
	
	"^ (self class environment classNamed: #RmRunnerExecutionEnvironment)"
	^ false
]
