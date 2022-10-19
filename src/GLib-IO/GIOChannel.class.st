"
IO Channels — portable support for using files, pipes and sockets

https://developer-old.gnome.org/glib/stable/glib-IO-Channels.html
"
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

{ #category : #private }
GIOChannel class >> g_io_channel_unix_new: fd [

	^ self ffiCall: #(GIOChannel *g_io_channel_unix_new(int fd))
]

{ #category : #private }
GIOChannel class >> g_io_channel_win32_new_fd: fd [

	^ self ffiCall: #(GIOChannel *g_io_channel_win32_new_fd(int fd))
]

{ #category : #'instance creation' }
GIOChannel class >> newFromFileDescriptor: fd [

	^ (OSPlatform current isWindows 
		ifTrue: [ self g_io_channel_win32_new_fd: fd ]
		ifFalse: [ self g_io_channel_unix_new: fd ]) 
		initialize
]

{ #category : #'instance creation' }
GIOChannel class >> newStderr [

	^ self newFromFileDescriptor: 2 "STDERR_FILENO"
]

{ #category : #'instance creation' }
GIOChannel class >> newStdin [

	^ self newFromFileDescriptor: 0 "STDIN_FILENO"
]

{ #category : #'instance creation' }
GIOChannel class >> newStdout [

	^ self newFromFileDescriptor: 1 "STDOUT_FILENO"
]

{ #category : #accessing }
GIOChannel >> close [

	self ffiCall: #(void g_io_channel_close (self))

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

	error := GErrorHolder new.
	buf := ExternalAddress new.
	read := FFISizeT newBuffer.
	size := FFISizeT newBuffer.
	pos := FFISizeT newBuffer.
	status := self 
		readLine: buf 
		size: size 
		terminator: pos 
		error: error.
	((status = G_IO_STATUS_ERROR) and: [ error value isError ]) 
		ifTrue: [ self error: error value messageString ].

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
		  "GError **" GErrorHolder error))
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
