"
Adds convenience methods to easy declaration of ""connecting"" properties (when defining interfaces or extending classes you need a structure that points to a bunch of callbacks)
"
Trait {
	#name : #GTConnectCallback,
	#category : #'GObject-ClassBuilder'
}

{ #category : #'connecting - convenience' }
GTConnectCallback >> connect: aProperty signature: aSignature to: aBlock [
	
	self
		perform: aProperty asMutator
		with: (GCallback 
			signature: aSignature
			block: aBlock)
]

{ #category : #'connecting - convenience' }
GTConnectCallback >> connectToNull: aProperty [
	
	self
		perform: aProperty asMutator 
		with: GCallback null
]
