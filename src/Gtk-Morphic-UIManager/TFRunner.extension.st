Extension { #name : 'TFRunner' }

{ #category : '*Gtk-Morphic-UIManager' }
TFRunner >> handleExceptionDuring: aBlock [

	UIManager default
		handleCallbackExceptionsWith: self exceptionHandler  
		during: aBlock
]
