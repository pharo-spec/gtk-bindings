"
A PangoStandaloneEngineTest is a test class for testing the behavior of PangoStandaloneEngine
"
Class {
	#name : #GlibStandaloneEngineTest,
	#superclass : #TestCase,
	#category : #'GlibStandaloneEngine-Test'
}

{ #category : #tests }
GlibStandaloneEngineTest >> testLifecycle [

	"This test requires only one available engine"
	GEngine reset. "If there is a current engine, this will #stop it."
	self assert: (GEngine ensureEngine isKindOf: GlibStandaloneEngine).

	"Until the engine is started, a new instance is answered by #ensureEngine."
	self deny: GEngine ensureEngine identicalTo: GEngine ensureEngine.

	"This sets the engine as current, so #ensureEngine will answer the same object."
	GEngine ensureEngine run.
	self assert: GEngine ensureEngine identicalTo: GEngine ensureEngine.

	"Test the main API method required to do FFI."
	self assert: (GEngine ensureEngine naturalRunner isKindOf: TFSameThreadRunner).
	
	"Tear-down, that will #stop and nilize the currrent engine."
	GEngine reset.

]
