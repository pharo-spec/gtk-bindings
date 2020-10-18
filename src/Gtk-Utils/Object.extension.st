Extension { #name : #Object }

{ #category : #'*Gtk-Utils' }
Object >> printToStdout [

	Stdio stdout << self printString << OSPlatform current lineEnding 
]
