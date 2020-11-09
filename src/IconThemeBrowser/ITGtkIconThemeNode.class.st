Class {
	#name : #ITGtkIconThemeNode,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #IconThemeBrowser
}

{ #category : #'instance creation' }
ITGtkIconThemeNode class >> newName: aName [

	^ self new
		name: aName;
		yourself
]

{ #category : #accessing }
ITGtkIconThemeNode >> children [

	^ #()
]

{ #category : #accessing }
ITGtkIconThemeNode >> name [

	^ name
]

{ #category : #accessing }
ITGtkIconThemeNode >> name: aString [

	name := aString
]

{ #category : #accessing }
ITGtkIconThemeNode >> withIconDo: aBlock [
	"do nothing"
]
