Extension { #name : #DebugSession }

{ #category : #'*Gtk-Morphic-UIManager' }
DebugSession class >> new [
	
	^ self = DebugSession 
		ifTrue: [ self sessionClass basicNew initialize ]
		ifFalse: [ super new ]
]

{ #category : #'*Gtk-Morphic-UIManager' }
DebugSession class >> sessionClass [

	^ UIManager default debugSessionClass
]
