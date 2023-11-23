Class {
	#name : 'GdkContentFormats',
	#superclass : 'GBaseObject',
	#traits : 'GdkTLibrary',
	#classTraits : 'GdkTLibrary classTrait',
	#category : 'Gdk-Misc',
	#package : 'Gdk',
	#tag : 'Misc'
}

{ #category : 'printing' }
GdkContentFormats >> toString [

	^ self ffiCall: #(char* gdk_content_formats_to_string (self))
]
