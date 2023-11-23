Class {
	#name : 'FcFontSet',
	#superclass : 'FcObject',
	#category : 'Pango-FontConfig',
	#package : 'Pango',
	#tag : 'FontConfig'
}

{ #category : 'printing' }
FcFontSet >> printToStdout [

	^ self ffiCall: #(void FcFontSetPrint(self))
]
