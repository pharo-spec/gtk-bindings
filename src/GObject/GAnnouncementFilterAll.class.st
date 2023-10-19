Class {
	#name : 'GAnnouncementFilterAll',
	#superclass : 'GAnnouncementFilter',
	#category : 'GObject-Signal',
	#package : 'GObject',
	#tag : 'Signal'
}

{ #category : 'testing' }
GAnnouncementFilterAll >> isFiltered: aSignal [

	^ true
]

{ #category : 'testing' }
GAnnouncementFilterAll >> isFilteredClass: aSignalClass [

	^ true
]
