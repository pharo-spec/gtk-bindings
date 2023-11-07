Class {
	#name : 'GLibLibrary',
	#superclass : 'GObjectLibrary',
	#category : 'GLib-Library',
	#package : 'GLib',
	#tag : 'Library'
}

{ #category : 'private - primitives' }
GLibLibrary >> gFree: anAddress [

	^ self ffiCall: #(void g_free(gpointer anAddress))
]

{ #category : 'accessing - platform' }
GLibLibrary >> gSetPrgName: prgname [

	^ self ffiCall: #(void g_set_prgname (const gchar *prgname))
]

{ #category : 'accessing - functions' }
GLibLibrary >> gstrdup: str [
	"since answering a char* will take control of the pointer and we do not 
	 want that, I answer a pointer. User will take control and need to free 
	 the pointer."

	^ self ffiCall: #(void* g_strdup (const gchar* str))
]

{ #category : 'accessing - platform' }
GLibLibrary >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findLibrary: 'libglib-2.0.so'
]

{ #category : 'accessing - platform' }
GLibLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findLibrary: 'libglib-2.0-0.dll'
]
