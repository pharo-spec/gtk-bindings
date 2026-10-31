"
I am the main-thread runner used by GTK application run loops. GTK calls are expected to run on the thread that owns the GTK main context; `TFMainThreadRunner` already provides that forwarding, and I add a diagnostic check for calls made while the run loop is active but from outside a callback.

The check is advisory. When `GRunLoop current` is running and is not in a callback, I print a warning naming the function and then forward the invocation to `super`, so the call still reaches GTK. That makes me useful when investigating unexpected GTK calls coming from Pharo processes while the event loop is running.

I am a singleton, obtained through `GtkMainThreadRunner uniqueInstance`. `GtkApplicationRunLoop` answers me from `naturalRunner`, so `GtkApplicationEngine` selects me automatically for GTK calls; direct installation is only needed when setting up a process-local worker by hand.

Example:

```smalltalk
GtkApplicationEngine new run
```

The application engine selects this runner through its run loop, and GTK calls made while the application runs are dispatched on the main thread.
"
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
