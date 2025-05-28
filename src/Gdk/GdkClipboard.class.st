Class {
	#name : 'GdkClipboard',
	#superclass : 'GObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : 'Gdk-Misc',
	#package : 'Gdk',
	#tag : 'Misc'
}

{ #category : 'instance creation' }
GdkClipboard class >> default [

	^ GdkDisplay default clipboard
]

{ #category : 'instance creation' }
GdkClipboard class >> primary [

	^ GdkDisplay default primaryClipboard
]

{ #category : 'accessing' }
GdkClipboard >> content [

	^ self ffiCall: #(GdkContentProvider *gdk_clipboard_get_content (self))
]

{ #category : 'accessing' }
GdkClipboard >> formats [

	^ self ffiCall: #(GdkContentFormats *gdk_clipboard_get_formats (self))
]

{ #category : 'private' }
GdkClipboard >> getDisplay [

	^ self ffiCall: #(GdkDisplay* gdk_clipboard_get_display (self))
]

{ #category : 'accessing' }
GdkClipboard >> readText [	
	| text sem |

	GRunLoop current isInCallback
		ifTrue: [ self error: 'Can''t be executed in a callback.' ].

	sem := Semaphore new.	
	GRunLoop defer: [ 
		self readTextDo: [ :aString | 
			text := aString.
			sem signal ] ].
	sem wait.
	^ text
]

{ #category : 'accessing' }
GdkClipboard >> readTextAsync: callback [

	self ffiCall: #(void gdk_clipboard_read_text_async (
  		self,
  		"GCancellable* cancellable"NULL,
  		"GAsyncReadyCallback"GCallback callback,
  		NULL))
]

{ #category : 'accessing' }
GdkClipboard >> readTextDo: aBlock [

	self readTextAsync: (GCallback
		signature: #(void (void *source, void *result, void *user_data))
		block: [ :source :resultHandle :user_data |
			| result error text |
			result := (GObject fromHandleUnreferenced: resultHandle).
			text := self readTextFinish: result.
			[ aBlock value: text ] fork ])
]

{ #category : 'accessing' }
GdkClipboard >> readTextFinish: result [

	self ffiCall: #(char* gdk_clipboard_read_text_finish (
		self,
 	 	"GAsyncResult*"void *result,
  		NULL))
]

{ #category : 'accessing' }
GdkClipboard >> setText: text [

	self ffiCall: #(void gdk_clipboard_set_text (self, const char* text))
]

{ #category : 'accessing' }
GdkClipboard >> string: aString [
	| value |

	value := GValue newString.
	value setString: aString.

	self value: value
]

{ #category : 'accessing' }
GdkClipboard >> text [

	^ self content string
]

{ #category : 'accessing' }
GdkClipboard >> text: text [

	self setText: text.
	self getDisplay flush
]

{ #category : 'accessing' }
GdkClipboard >> texture: texture [

	self ffiCall: #(void gdk_clipboard_set_texture (self, GdkTexture* texture))
]

{ #category : 'accessing' }
GdkClipboard >> value: value [

	self ffiCall: #(void gdk_clipboard_set_value (self, GValue *value))
]
