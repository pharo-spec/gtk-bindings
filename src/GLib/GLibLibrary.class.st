Class {
	#name : #GLibLibrary,
	#superclass : #GObjectLibrary,
	#category : #'GLib-Base'
}

{ #category : #'private - primitives' }
GLibLibrary >> gFree: anAddress [

	^ self ffiCall: #(void g_free(gpointer anAddress))
]

{ #category : #'accessing - platform' }
GLibLibrary >> gSetPrgName: prgname [

	^ self ffiCall: #(void g_set_prgname (const gchar *prgname))
]

{ #category : #'accessing - platform' }
GLibLibrary >> win32LibraryName [

	^ 'libglib-2.0-0.dll'
]
