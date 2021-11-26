Extension { #name : #Object }

{ #category : #'*Gtk-Utils' }
Object >> printToStdout [

	Stdio stdout << self printString << OSPlatform current lineEnding; flush
]

{ #category : #'*Gtk-Utils' }
Object >> printToTranscript [

	Transcript show: self printString; cr
]
