Class {
	#name : #GIOChannel,
	#superclass : #GBaseObject,
	#instVars : [
		'callbacks'
	],
	#pools : [
		'GIOCondition',
		'GIOError',
		'GIOStatus'
	],
	#category : #'GLib-IO'
}

{ #category : #'library path' }
GIOChannel class >> ffiLibraryName [

	^ GIOChannelLibrary
]

{ #category : #'instance creation' }
GIOChannel class >> g_io_channel_unix_new: fd [

	^ self ffiCall: #(GIOChannel *g_io_channel_unix_new(int fd))
]

{ #category : #'instance creation' }
GIOChannel class >> newFromFileDescriptor: fd [

	self flag: #TODO. "if windows is different"
	^ (self g_io_channel_unix_new: fd) initialize

]

{ #category : #'library path' }
GIOChannel >> ffiLibraryName [

	^ GIOChannelLibrary
]

{ #category : #accessing }
GIOChannel >> flush [

	^ self ffiCall: #(GIOStatus g_io_channel_flush (self, NULL))
	

]

{ #category : #'private - primitives' }
GIOChannel >> gAddWatch: func condition: condition data: user_data [

	^ self ffiCall: #(guint g_io_add_watch (
  self,
  GIOCondition condition,
  "GIOFunc "GCallback func,
  gpointer user_data
))
]

{ #category : #initialization }
GIOChannel >> initialize [

	super initialize.
	self autoRelease
]

{ #category : #accessing }
GIOChannel >> read: aNumber [
	| buf read error status |

	error := GError new.
	read := FFISizeT newBuffer.
	buf := ByteArray new: aNumber.
	status := self 
		readChars: buf 
		count: aNumber 
		bytesRead: read 
		error: error.
	status = G_IO_STATUS_ERROR 
		ifTrue: [ self error: error messageString ].
	
	^ buf
]

{ #category : #'private - primitives' }
GIOChannel >> read: buf count: count bytesRead: bytes_read [

	self ffiCall: #(GIOError g_io_channel_read (
	  self,
	  gchar *buf,
	  gsize count,
	  "gsize *"void *bytes_read
	))
]

{ #category : #'private - primitives' }
GIOChannel >> readChars: buf count: count bytesRead: bytes_read error: error [

	^ self ffiCall: #(GIOStatus g_io_channel_read_chars (
		self,
  		gchar *buf,
  		gsize count,
  		"gsize *"void *bytes_read,
  		"GError **"GError *error))
]

{ #category : #accessing }
GIOChannel >> readLine [
	| buf read size pos error status |

	error := GError new.
	buf := ExternalAddress new.
	read := FFISizeT newBuffer.
	size := FFISizeT newBuffer.
	pos := FFISizeT newBuffer.
	status := self 
		readLine: buf 
		size: size 
		terminator: pos 
		error: error.
	((status = G_IO_STATUS_ERROR) and: [ error isError ]) 
		ifTrue: [ self error: error messageString ].

	^ buf readStringUTF8
]

{ #category : #'private - primitives' }
GIOChannel >> readLine: str_return size: length terminator: terminator_pos error: error [

	self ffiCall: #(GIOStatus
		g_io_channel_read_line (
		  self,
		  "gchar **"void **str_return,
		  "gsize *"void *length,
		  "gsize *"void *terminator_pos,
		  "GError **" GError *error))
]

{ #category : #accessing }
GIOChannel >> shutDown: flush [

	self ffiCall: #(GIOStatus g_io_channel_shutdown (self, gboolean flush, NULL))
]

{ #category : #'accessing - watching' }
GIOChannel >> watch: aCallback [

	^ self 
		watch: aCallback 
		condition: (GIOCondition newValue: 16rFF) "everything"
]

{ #category : #'accessing - watching' }
GIOChannel >> watch: aBlock condition: aCondition [
	| callback |

	callback := GCallback 
		signature: #(gboolean (void *channel, int condition, void *user_data)) 
		block: [ :channel :condition :user_data | aBlock value: self ].

	callbacks ifNil: [ callbacks := Set new ].
	callbacks add: callback.
	
	^ self 
		gAddWatch: callback 
		condition: aCondition 
		data: ExternalAddress null
]

{ #category : #accessing }
GIOChannel >> write: aString [
	| status written error |

	error := GError new.
	written := FFISizeT newBuffer.
	status := self 
		writeChars: aString 
		count: aString size 
		bytesWritten: written 
		error: error.
	(status = G_IO_STATUS_ERROR)
		ifTrue: [ self error: error messageString ].
		
	^ written signedLongAt: 1 
]

{ #category : #'private - primitives' }
GIOChannel >> write: buf count: count bytesWritten: bytes_written [

	self ffiCall: #(GIOError g_io_channel_write (
	  self,
	  const gchar *buf,
	  gsize count,
	  "gsize *"void *bytes_written))
]

{ #category : #'private - primitives' }
GIOChannel >> writeChars: buf count: count bytesWritten: bytes_written error: error [

	^ self ffiCall: #(GIOStatus g_io_channel_write_chars (
		self,
		const gchar *buf,
		gssize count,
		"gsize *"void *bytes_written,
		"GError**"GError *error))
]

{ #category : #accessing }
GIOChannel >> writeFlush: aString [

	self write: aString.
	self flush
]

{ #category : #accessing }
GIOChannel >> writeLine: aString [

	self write: aString, (OSPlatform current lineEnding asString)
]

{ #category : #accessing }
GIOChannel >> writeLineFlush: aString [

	self writeLine: aString.
	self flush
]
