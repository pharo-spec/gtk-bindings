Extension { #name : #ExternalAddress }

{ #category : #'*Gtk' }
ExternalAddress >> gFree [

	GLibLibrary uniqueInstance gFree: self
]
