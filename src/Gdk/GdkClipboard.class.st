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

{ #category : 'accessing' }
GdkClipboard >> readText [
	| sem result error |

	sem := Semaphore new.
	self readTextAsync: (GCallback
		signature: #(void (void *source, void *result, void *user_data))
		block: [ :source :aResult :user_data |
			result := aResult.
			sem signal ]).
	sem wait.
	error := GErrorHolder new.
	(GObject fromHandleUnreferenced: result) autoRelease.
	^ self readTextFinish: result error: error
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
GdkClipboard >> readTextFinish: result error: error [

	self ffiCall: #(char* gdk_clipboard_read_text_finish (
		self,
 	 	"GAsyncResult*"void *result,
  		GErrorHolder error))
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

	self ffiCall: #(void gdk_clipboard_set_text (self, const char* text))
]

{ #category : 'accessing' }
GdkClipboard >> texture: texture [

	self ffiCall: #(void gdk_clipboard_set_texture (self, GdkTexture* texture))
]

{ #category : 'accessing' }
GdkClipboard >> value: value [

	self ffiCall: #(void gdk_clipboard_set_value (self, GValue *value))
]
