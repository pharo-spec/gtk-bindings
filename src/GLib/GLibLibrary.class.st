Class {
	#name : #GLibLibrary,
	#superclass : #GObjectLibrary,
	#category : #'GLib-Base'
}

{ #category : #'private - primitives' }
GLibLibrary >> gFree: anAddress [

	^ self ffiCall: #(void g_free(gpointer anAddress))
]

{ #category : #'as yet unclassified' }
GLibLibrary >> gSetPrgName: prgname [

	^ self ffiCall: #(void g_set_prgname (const gchar *prgname))
]

{ #category : #'accessing - platform' }
GLibLibrary >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findLibrary: 'libglib-2.0.so'
]

{ #category : #'accessing - platform' }
GLibLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findLibrary: 'libglib-2.0-0.dll'
]
