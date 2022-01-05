Extension { #name : #Context }

{ #category : #'*Gtk-Utils' }
Context >> printToStdout [

	self shortDebugStackOn: (ZnNewLineWriterStream on: Stdio stdout)
]

{ #category : #'*Gtk-Utils' }
Context >> printToTranscript [

	self shortDebugStackOn: Transcript
]
