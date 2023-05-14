Class {
	#name : #GExternalResourceManager,
	#superclass : #FFIExternalResourceManager,
	#category : #'GObject-Base'
}

{ #category : #'external resource management' }
GExternalResourceManager >> addResource: anObject data: resourceData [
	
	(self includesObjectWithHandle: anObject getHandle) ifTrue: [ ^ self ].
	^ super
		addResource: anObject 
		data: resourceData
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
