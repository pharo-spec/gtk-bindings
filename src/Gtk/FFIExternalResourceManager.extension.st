Extension { #name : 'FFIExternalResourceManager' }

{ #category : '*Gtk' }
FFIExternalResourceManager class >> removeResource: anObject [
	^ self uniqueInstance removeResource: anObject
]
