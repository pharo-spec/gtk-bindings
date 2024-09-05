"
To add enumeration capabilities to GList family.
"
Trait {
	#name : 'GTEnumerable',
	#category : 'GLib-Lists',
	#package : 'GLib',
	#tag : 'Lists'
}

{ #category : 'enumerating' }
GTEnumerable >> collect: aBlock [ 

	^ Array streamContents: [ :stream | 
		self do: [ :each | stream nextPut: (aBlock value: each) ] ]
]

{ #category : 'enumerating' }
GTEnumerable >> detect: aBlock [

	^ self detect: aBlock ifNone: [ NotFound signalFor: aBlock ]
]

{ #category : 'enumerating' }
GTEnumerable >> detect: aBlock ifNone: noneBlock [

	self do: [ :each | 
		(aBlock value: each) ifTrue: [ ^ aBlock ] ].
	
	^ noneBlock value
]

{ #category : 'enumerating' }
GTEnumerable >> do: aBlock [

	self required
]

{ #category : 'enumerating' }
GTEnumerable >> select: aBlock [

	^ Array streamContents: [ :stream |
		self do: [ :each | 
			(aBlock value: each)
				ifTrue: [ stream nextPut: each ] ] ]	

]
