Extension { #name : #FFIExternalResourceManager }

{ #category : #'*Gtk' }
FFIExternalResourceManager >> removeResource: anObject [

	registry remove: anObject ifAbsent: []
]

{ #category : #'*Gtk' }
FFIExternalResourceManager class >> removeResource: anObject [
	^ self uniqueInstance removeResource: anObject
]
