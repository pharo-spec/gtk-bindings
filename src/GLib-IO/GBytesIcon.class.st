"
https://docs.gtk.org/gio/class.BytesIcon.html
"
Class {
	#name : 'GBytesIcon',
	#superclass : 'GIcon',
	#category : 'GLib-IO-Icon',
	#package : 'GLib-IO',
	#tag : 'Icon'
}

{ #category : 'instance creation' }
GBytesIcon class >> fromByteArray: aByteArray [
	| bytes instance |

	bytes := GBytes newData: aByteArray.
	instance := self newBytes: bytes.
	bytes unref.
	^ instance
]

{ #category : 'private' }
GBytesIcon class >> gNewBytes: bytes [

	^ self ffiCall: #(GBytesIcon* g_bytes_icon_new (GBytes* bytes))
]

{ #category : 'instance creation' }
GBytesIcon class >> newBytes: aGBytes [

	^ (self gNewBytes: aGBytes) initialize
]
