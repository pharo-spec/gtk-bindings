Class {
	#name : #GExternalResourceManager,
	#superclass : #FFIExternalResourceManager,
	#category : #'GObject-Base'
}

{ #category : #'external resource management' }
GExternalResourceManager >> addResource: anObject data: resourceData [
	
	(self includesObject: anObject) ifTrue: [ ^ self ].
	^ super
		addResource: anObject 
		data: resourceData
]

{ #category : #testing }
GExternalResourceManager >> includesObject: anObject [

	^ registry includes: anObject
]
