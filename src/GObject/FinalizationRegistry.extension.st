Extension { #name : 'FinalizationRegistry' }

{ #category : '*GObject' }
FinalizationRegistry >> detect: aBlock ifFound: foundBlock [
	| current |
	
	current := ephemeronListHead.
	[ current notNil ] 
	whileTrue: [ 
		current key ifNotNil: [ :aKey | 
			(aBlock value: aKey) 
				ifTrue: [ ^ foundBlock value: current value ] ].
		current := current next ].
		
	^ nil
]
