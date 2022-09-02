Extension { #name : #ExternalAddress }

{ #category : #'*GLib-IO' }
ExternalAddress >> gfree [

	^ self 
		ffiCall: #(void g_free (self)) 
		module: GLibLibrary
]
