Extension { #name : #FinalizationRegistry }

{ #category : #'*GObject' }
FinalizationRegistry >> detect: aBlock ifFound: foundBlock [ 

	^ ephemeronCollection 
		detect: [ :each | aBlock value: each key ] 
		ifFound: foundBlock
]
