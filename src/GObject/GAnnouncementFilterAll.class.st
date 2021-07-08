Class {
	#name : #GAnnouncementFilterAll,
	#superclass : #GAnnouncementFilter,
	#category : #'GObject-Signal'
}

{ #category : #testing }
GAnnouncementFilterAll >> isFiltered: aSignal [

	^ true
]

{ #category : #testing }
GAnnouncementFilterAll >> isFilteredClass: aSignalClass [

	^ true
]
