Class {
	#name : #GAnnouncementFilter,
	#superclass : #Object,
	#category : #'GObject-Signal'
}

{ #category : #actions }
GAnnouncementFilter >> install [

	GSignalBaseAnnouncement activeFilter: self
]

{ #category : #testing }
GAnnouncementFilter >> isFiltered: aSignal [

	^ self subclassResponsibility
]

{ #category : #testing }
GAnnouncementFilter >> isFilteredClass: aSignalClass [

	^ self subclassResponsibility
]

{ #category : #testing }
GAnnouncementFilter >> isTracing: aSignal [

	^ (self isFiltered: aSignal) not
]

{ #category : #testing }
GAnnouncementFilter >> isTracingFilter [
	
	^ false
]
