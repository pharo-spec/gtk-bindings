Class {
	#name : 'GMainThreadRunner',
	#superclass : 'TFMainThreadRunner',
	#category : 'GObject-Base',
	#package : 'GObject',
	#tag : 'Base'
}

{ #category : 'executing' }
GMainThreadRunner >> invokeFunction: function withArguments: aCollection [

	logger trace: function functionName.

	self flag: #REMOVEME. "This is temporal, and of course imposes some penalties"
	(GRunLoop current isNotNil
		and: [ GRunLoop current isRunning ])
		ifTrue: [
			('WARNING: Attempt to write in main thread outside a callback = ', function functionName) printToStdout.
			"thisContext printToStdout" ].

	^ super
		invokeFunction: function
		withArguments: aCollection
]
