"
I'm a generic signal to be used on Gtk platform.
"
Class {
	#name : #GSignalBaseAnnouncement,
	#superclass : #BeaconSignal,
	#classVars : [
		'ActiveFilter'
	],
	#category : #'GObject-Signal'
}

{ #category : #private }
GSignalBaseAnnouncement class >> activeFilter [

	^ ActiveFilter ifNil: [ ActiveFilter := GAnnouncementFilterAll new ]
]

{ #category : #private }
GSignalBaseAnnouncement class >> activeFilter: aFilter [

	ActiveFilter := aFilter
]

{ #category : #'instance creation' }
GSignalBaseAnnouncement class >> emit [ 
	
	^ self new emit
]

{ #category : #private }
GSignalBaseAnnouncement class >> ensureTracingFilter [

	self activeFilter isTracingFilter 
		ifFalse: [ ActiveFilter := GAnnouncementTracingFilter new ].
	^ ActiveFilter
]

{ #category : #'accessing filtering' }
GSignalBaseAnnouncement class >> filter [
	
	self ensureTracingFilter trace: self
	 
	
]

{ #category : #'accessing filtering' }
GSignalBaseAnnouncement class >> filterAllSignalsExcept: aListOfSignals [

	ActiveFilter := GAnnouncementTracingFilter newTraceSignals: aListOfSignals
]

{ #category : #'class initialization' }
GSignalBaseAnnouncement class >> initialize [ 

	self resetFilters
]

{ #category : #'accessing filtering' }
GSignalBaseAnnouncement class >> isFiltered [
	
	^ self activeFilter isFilteredClass: self
]

{ #category : #private }
GSignalBaseAnnouncement class >> resetFilters [

	ActiveFilter := GAnnouncementFilterAll new
]

{ #category : #'accessing filtering' }
GSignalBaseAnnouncement class >> traceSignal [
	
	self ensureTracingFilter trace: self
]

{ #category : #emitting }
GSignalBaseAnnouncement >> emit [ 

	self isFiltered ifTrue: [ ^ self ].
	^ super emit
]

{ #category : #testing }
GSignalBaseAnnouncement >> isFiltered [

	^ self class activeFilter isFiltered: self
]

{ #category : #'as yet unclassified' }
GSignalBaseAnnouncement >> logIn: aLogger [

	"Do nothing"
]
