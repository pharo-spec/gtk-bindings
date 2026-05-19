Class {
	#name : 'GtkMainThreadRunner',
	#superclass : 'TFMainThreadRunner',
	#category : 'Gtk-App-Experimental',
	#package : 'Gtk',
	#tag : 'App-Experimental'
}

{ #category : 'executing' }
GtkMainThreadRunner >> invokeFunction: function withArguments: aCollection [

	logger trace: function functionName.
	
	self flag: #REMOVEME. "This is temporal, and of course imposes some penalties"
	(GRunLoop current isNotNil 
		and: [ GRunLoop current isRunning 
		and: [ GRunLoop current isInCallback not ] ])
		ifTrue: [ 
			('WARNING: Attempt to write in main thread outside a callback = ', function functionName) printToStdout.
			"thisContext printToStdout" ].

	^ super 
		invokeFunction: function 
		withArguments: aCollection
]
