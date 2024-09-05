"
https://docs.gtk.org/glib/struct.Variant.html
"
Class {
	#name : 'GVariant',
	#superclass : 'GBaseObject',
	#traits : 'GLibTLibrary',
	#classTraits : 'GLibTLibrary classTrait',
	#category : 'GLib-Misc',
	#package : 'GLib',
	#tag : 'Misc'
}

{ #category : 'private' }
GVariant class >> gNewUint32: value [

	self ffiCall: #(GVariant* g_variant_new_uint32 (guint32 value))
]

{ #category : 'private' }
GVariant class >> gNewUint64: value [

	self ffiCall: #(GVariant* g_variant_new_uint64 (guint64 value))
]

{ #category : 'instance creation' }
GVariant class >> newUint32: aValue [

	^ (self gNewUint32: aValue) initialize
]

{ #category : 'instance creation' }
GVariant class >> newUint64: aValue [

	^ (self gNewUint64: aValue) initialize
]
