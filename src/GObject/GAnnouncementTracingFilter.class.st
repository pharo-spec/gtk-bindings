Class {
	#name : #GAnnouncementTracingFilter,
	#superclass : #GAnnouncementFilter,
	#instVars : [
		'tracingSignals'
	],
	#category : #'GObject-Signal'
}

{ #category : #'instance creation' }
GAnnouncementTracingFilter class >> newTraceSignals: aListOfSignals [

	^ self new 
		tracingSignals: aListOfSignals;
		yourself

]

{ #category : #initialization }
GAnnouncementTracingFilter >> initialize [

	super initialize.
	self tracingSignals: OrderedCollection new
]

{ #category : #testing }
GAnnouncementTracingFilter >> isFiltered: aSignal [

	^ self isFilteredClass: aSignal class
]

{ #category : #testing }
GAnnouncementTracingFilter >> isFilteredClass: aSignalClass [

	^ (tracingSignals includes: aSignalClass) not
]

{ #category : #testing }
GAnnouncementTracingFilter >> isTracingFilter [

	^ true
]

{ #category : #accessing }
GAnnouncementTracingFilter >> removeTraceFor: aSignalClass [

	tracingSignals 
		remove: aSignalClass 
		ifAbsent: [ ]
]

{ #category : #accessing }
GAnnouncementTracingFilter >> trace: aSignalClass [

	tracingSignals add: aSignalClass
]

{ #category : #initialization }
GAnnouncementTracingFilter >> tracingSignals: aCollection [

	tracingSignals := aCollection asOrderedCollection
]
