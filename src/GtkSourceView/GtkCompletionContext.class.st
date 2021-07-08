"
A completion context prepared to work on `GtkPharoSourceCompletionProvider`.
"
Class {
	#name : #GtkCompletionContext,
	#superclass : #CoCompletionContext,
	#instVars : [
		'token'
	],
	#category : #'GtkSourceView-Completion'
}

{ #category : #accessing }
GtkCompletionContext >> completionToken [

	^ token
]

{ #category : #narrowing }
GtkCompletionContext >> narrowWith: aToken [

	token := aToken.
	^ super narrowWith: aToken
]
