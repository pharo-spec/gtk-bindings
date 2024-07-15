"
A completion context prepared to work on `GtkPharoSourceCompletionProvider`.
"
Class {
	#name : 'GtkCompletionContext',
	#superclass : 'CoCompletionContext',
	#instVars : [
		'token'
	],
	#category : 'GtkSourceView-Completion-Pharo',
	#package : 'GtkSourceView',
	#tag : 'Completion-Pharo'
}

{ #category : 'accessing' }
GtkCompletionContext >> completionToken [

	^ token
]

{ #category : 'accessing' }
GtkCompletionContext >> completionTokenStart [

	^ 1
]

{ #category : 'accessing' }
GtkCompletionContext >> engine: anEngine [

	engine := anEngine
]

{ #category : 'narrowing' }
GtkCompletionContext >> narrowWith: aToken [

	token := aToken.
	^ super narrowWith: aToken
]
