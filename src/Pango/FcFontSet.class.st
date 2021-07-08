Class {
	#name : #FcFontSet,
	#superclass : #FcObject,
	#category : #'Pango-FontConfig'
}

{ #category : #printing }
FcFontSet >> printToStdout [

	^ self ffiCall: #(void FcFontSetPrint(self))
]
