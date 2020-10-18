Extension { #name : #UIManager }

{ #category : #'*Gtk-Morphic-UIManager' }
UIManager >> debugSessionClass [

	^ DebugSession
]

{ #category : #'*Gtk-Morphic-UIManager' }
UIManager >> handleCallbackExceptionsWith: exceptionHandler during: aBlock [

	exceptionHandler handleExceptionDuring: aBlock	
]
