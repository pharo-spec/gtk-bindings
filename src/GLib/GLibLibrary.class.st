Class {
	#name : #GLibLibrary,
	#superclass : #GtkLibrary,
	#category : #GLib
}

{ #category : #'private primitives' }
GLibLibrary >> gFree: anAddress [

	^ self ffiCall: #(void g_free(gpointer anAddress))
]

{ #category : #'as yet unclassified' }
GLibLibrary >> gSetPrgName: prgname [

	^ self ffiCall: #(void g_set_prgname (const gchar *prgname))
]

{ #category : #'accessing platform' }
GLibLibrary >> win32LibraryName [

	^ 'libglib-2.0-0.dll'
]
