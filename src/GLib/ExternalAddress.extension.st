Extension { #name : #ExternalAddress }

{ #category : #'*GLib' }
ExternalAddress >> gFree [

	GLibLibrary uniqueInstance gFree: self
]
