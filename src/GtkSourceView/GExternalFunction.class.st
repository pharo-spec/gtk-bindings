Class {
	#name : #GExternalFunction,
	#superclass : #Object,
	#instVars : [
		'ffiLibrary',
		'function'
	],
	#category : #'GtkSourceView-Utils'
}

{ #category : #'instance creation' }
GExternalFunction class >> new [

	self error: 'Use #newFromAddress:signature:library:'
]

{ #category : #'instance creation' }
GExternalFunction class >> newAddress: anExternalAddress signature: aSignature library: aFFILibrary [

	^ self basicNew
		initializeAddress: anExternalAddress 
			signature: aSignature 
			library: aFFILibrary;
		yourself
]

{ #category : #'instance creation' }
GExternalFunction class >> newName: aName signature: aSignature library: aFFILibrary [

	^ self 
		newAddress: (ExternalAddress loadSymbol: aName from: aFFILibrary) 
		signature: aSignature
		library: aFFILibrary
]

{ #category : #initialization }
GExternalFunction >> initializeAddress: anExternalAddress signature: aSignature library: aFFILibrary [

	ffiLibrary := aFFILibrary.
	function := TFExternalFunction 
		fromAddress: anExternalAddress
		definition: (self parseSignature: aSignature)
]

{ #category : #invoking }
GExternalFunction >> invokeWithArguments: aCollection [

	^ ffiLibrary runner
		invokeFunction: function 
		withArguments: aCollection
]

{ #category : #initialization }
GExternalFunction >> parseSignature: aSignature [
	| parser functionSpec |
	
	parser := GCallback basicNew newParser.
	functionSpec := parser parseAnonymousFunction: aSignature.
	functionSpec resolveUsing: parser requestor.
	
	^ TFFunctionDefinition 
		parameterTypes: (functionSpec arguments collect: #tfExternalTypeWithArity)
		returnType: functionSpec returnType tfExternalTypeWithArity
]
