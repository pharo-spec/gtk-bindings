"
https://docs.gtk.org/glib/struct.VariantType.html

type strings: 
https://docs.gtk.org/glib/struct.VariantType.html#gvariant-type-strings
"
Class {
	#name : 'GVariantType',
	#superclass : 'GBaseObject',
	#traits : 'GLibTLibrary',
	#classTraits : 'GLibTLibrary classTrait',
	#category : 'GLib-Misc',
	#package : 'GLib',
	#tag : 'Misc'
}

{ #category : 'private' }
GVariantType class >> gNewType: type_string [

	^ self ffiCall: #(GVariantType* g_variant_type_new (const gchar* type_string))
]

{ #category : 'instance creation' }
GVariantType class >> newInt64 [

	^ self newType: 'x' "G_VARIANT_TYPE_INT64" 
]

{ #category : 'instance creation' }
GVariantType class >> newType: aString [

	^ (self gNewType: aString) initialize
]

{ #category : 'instance creation' }
GVariantType class >> newUint64 [

	^ self newType: 't' "G_VARIANT_TYPE_UINT64" 
]

{ #category : 'finalization' }
GVariantType >> free [

	self ffiCall: #(void g_variant_type_free (self))
]

{ #category : 'accessing' }
GVariantType >> peekString [

	^ self ffiCall: #(const gchar* g_variant_type_peek_string (self))
]
