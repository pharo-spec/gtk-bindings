"
I am a GEngine that just executes on in the image's same thread.

I am a substitution for the GtkEngine to call Glib API.

"
Class {
	#name : #GlibStandaloneEngine,
	#superclass : #GEngine,
	#category : #GlibStandaloneEngine
}

{ #category : #testing }
GlibStandaloneEngine class >> isAvailable [

	^ true
]

{ #category : #'system startup' }
GlibStandaloneEngine >> ensureRunLoop [

	^ runLoop ifNil: [ runLoop := GlibStandaloneRunLoop new ]

]

{ #category : #accessing }
GlibStandaloneEngine >> naturalRunner [

	^ runLoop naturalRunner
]

{ #category : #'private running' }
GlibStandaloneEngine >> start [

	self isRunning ifTrue: [ self stop ].
	runLoop start
]

{ #category : #'private running' }
GlibStandaloneEngine >> stop [
	self isRunning ifFalse: [ ^ self ].
	runLoop stop
]
