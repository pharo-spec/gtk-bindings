Class {
	#name : #FcFontSet,
	#superclass : #FcObject,
	#category : #'Gtk-Pango-FontConfig'
}

{ #category : #printing }
FcFontSet >> printToStdout [

	^ self ffiCall: #(void FcFontSetPrint(self))
]
