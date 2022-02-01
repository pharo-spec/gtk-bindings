"
I am a GEngine that just executes on in the image's same thread.

I am a substitution for the GtkEngine to call Pango API.

"
Class {
	#name : #PangoStandaloneEngine,
	#superclass : #GEngine,
	#category : #PangoStandaloneEngine
}

{ #category : #testing }
PangoStandaloneEngine class >> isAvailable [

	^ true
]

{ #category : #'system startup' }
PangoStandaloneEngine >> ensureRunLoop [

	^ runLoop ifNil: [ runLoop := PangoStandaloneRunLoop new ]

]

{ #category : #accessing }
PangoStandaloneEngine >> naturalRunner [

	^ runLoop naturalRunner
]

{ #category : #'private running' }
PangoStandaloneEngine >> start [

	self isRunning ifTrue: [ self stop ].
	runLoop start
]

{ #category : #'private running' }
PangoStandaloneEngine >> stop [
	self isRunning ifFalse: [ ^ self ].
	runLoop stop
]
