Class {
	#name : 'GdkContentProvider',
	#superclass : 'GObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : 'Gdk-Misc',
	#package : 'Gdk',
	#tag : 'Misc'
}

{ #category : 'accessing' }
GdkContentProvider >> getValue: value error: error [

	self ffiCall: #(gboolean gdk_content_provider_get_value (
		self,
		GValue *value,
		void **error))
]

{ #category : 'accessing' }
GdkContentProvider >> string [
	| value errorHolder result |

	value := GValue newString.
	"errorHolder := ExternalAddress null."
	"errorHolder := GErrorHolder new."
	errorHolder := ExternalAddress fromAddress: 42.
	result := self getValue: value getHandle error: errorHolder.
	result ifFalse: [
		self halt.
		self error: errorHolder value messageString ].

	^ value getString
]
