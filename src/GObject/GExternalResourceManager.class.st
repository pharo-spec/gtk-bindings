Class {
	#name : #GExternalResourceManager,
	#superclass : #FFIExternalResourceManager,
	#category : #'GObject-Base'
}

{ #category : #'external resource management' }
GExternalResourceManager >> addResource: anObject [
	
	(self includesObjectWithHandle: anObject getHandle) ifTrue: [ ^ self ].
	registry add: anObject
]

{ #category : #'external resource management' }
GExternalResourceManager >> addResource: anObject data: resourceData [
	
	self flag: #REMOVEME.
	self error: 'Should not arrive here'.
	self addResource: anObject
]

{ #category : #testing }
GExternalResourceManager >> includesObject: anObject [

	^ registry includes: anObject
]

{ #category : #testing }
GExternalResourceManager >> includesObjectWithHandle: anObject [

	registry 
		detect: [ :each | each getHandle = anObject ]
		ifFound: [ :aResource | ^ true ].
		
	^ false
]

{ #category : #removing }
GExternalResourceManager >> removeResource: aGObject [
	| removed |

	removed := registry remove: self ifAbsent: [ nil ]. 
	removed ifNil: [ 
		registry
			detect: [ :each | each getHandle = aGObject getHandle ]
			ifFound: [ :gObject | registry remove: gObject ifAbsent: [ ] ] ]
]
