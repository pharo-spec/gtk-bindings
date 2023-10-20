Class {
	#name : 'GAnnouncementCondition',
	#superclass : 'GAnnouncementFilter',
	#instVars : [
		'conditionBlock'
	],
	#category : 'GObject-Signal',
	#package : 'GObject',
	#tag : 'Signal'
}

{ #category : 'instance creation' }
GAnnouncementCondition class >> installWhen: aCondition [

	^ self new 
		when: aCondition;
		install
]

{ #category : 'instance creation' }
GAnnouncementCondition class >> newWhen: aCondition [

	^ self new when: aCondition
]

{ #category : 'initialization' }
GAnnouncementCondition >> initialize [

	super initialize.
	conditionBlock := [ :aSignal | true ]
]

{ #category : 'testing' }
GAnnouncementCondition >> isFiltered: aSignal [

	^ (conditionBlock value: aSignal) not
]

{ #category : 'testing' }
GAnnouncementCondition >> isFilteredClass: aSignalClass [

	^ true
]

{ #category : 'accessing' }
GAnnouncementCondition >> when: aBlock [ 

	conditionBlock := aBlock
]
