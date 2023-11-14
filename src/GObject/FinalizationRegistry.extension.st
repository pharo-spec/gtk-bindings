Extension { #name : 'FinalizationRegistry' }

{ #category : '*GObject' }
FinalizationRegistry >> detect: aBlock ifFound: foundBlock [
	
	^ ephemeronList 
		detect: [ :entry | aBlock value: entry key ]
		ifFound: [ :entry | foundBlock value: entry value ]
		ifNone: [ nil ]
]
