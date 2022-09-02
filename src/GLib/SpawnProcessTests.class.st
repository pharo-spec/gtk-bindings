Class {
	#name : #SpawnProcessTests,
	#superclass : #TestCase,
	#pools : [
		'GSpawnFlags'
	],
	#category : #'GLib-Tests'
}

{ #category : #tests }
SpawnProcessTests >> testCanGetExitStatusFromLaunchCommand [
	| process |
	process := "GIOProcess" GIOSyncProcess
		spawn: '/bin/ls'
		arguments: #( '/foo/bar' )
		flags: G_SPAWN_DEFAULT.
		
	process run.
	500 milliSeconds wait.
	
	self assert: process isComplete.
	self deny: process isSuccess.
	self assert: process exitStatusInterpreter isExited.
	"Exit code is 1 on OS X, 2 on Linux"
	self assert: (#(1 2) includes: process exitStatusInterpreter statusIfExited).


]
