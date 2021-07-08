Class {
	#name : #FcTypes,
	#superclass : #SharedPool,
	#classVars : [
		'FcBool',
		'FcChar8',
		'FcSetName'
	],
	#category : #'Pango-FontConfig'
}

{ #category : #initialization }
FcTypes >> initialize [

	FcChar8 := #char.
	FcBool := #Boolean.
	FcSetName := #int
]
