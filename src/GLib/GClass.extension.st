Extension { #name : 'GClass' }

{ #category : '*GLib' }
GClass >> gInternStaticString: string [

	^ self 
		ffiCall: #(void *g_intern_static_string (const gchar *string))
		module: GLibLibrary
]

{ #category : '*GLib' }
GClass >> gInternStaticStringFromByteArray: string [

	^ self 
		ffiCall: #(void *g_intern_static_string (ByteArray string))
		module: GLibLibrary
]
