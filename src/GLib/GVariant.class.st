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
GVariant class >> gNewBoolean: value [

	self ffiCall: #(GVariant* g_variant_new_boolean (gboolean value))
]

{ #category : 'private' }
GVariant class >> gNewByteString: string [

	^ self ffiCall: #(GVariant* g_variant_new_bytestring (const gchar* string))

]

{ #category : 'private' }
GVariant class >> gNewInt64: value [

	self ffiCall: #(GVariant* g_variant_new_int64 (gint64 value))
]

{ #category : 'private' }
GVariant class >> gNewString: string [

	^ self ffiCall: #(GVariant* g_variant_new_string (const gchar* string))

]

{ #category : 'private' }
GVariant class >> gNewUint32: value [

	self ffiCall: #(GVariant* g_variant_new_uint32 (guint32 value))
]

{ #category : 'private' }
GVariant class >> gNewUint64: value [

	self ffiCall: #(GVariant* g_variant_new_uint64 (guint64 value))
]

{ #category : 'instance creation' }
GVariant class >> newBoolean: aValue [

	^ (self gNewBoolean: aValue) initialize
]

{ #category : 'instance creation' }
GVariant class >> newByteString: aString [

	^ (self gNewByteString: aString) initialize
]

{ #category : 'instance creation' }
GVariant class >> newInt64: aValue [

	^ (self gNewInt64: aValue) initialize
]

{ #category : 'instance creation' }
GVariant class >> newString: aString [

	^ (self gNewString: aString) initialize
]

{ #category : 'instance creation' }
GVariant class >> newUint32: aValue [

	^ (self gNewUint32: aValue) initialize
]

{ #category : 'instance creation' }
GVariant class >> newUint64: aValue [

	^ (self gNewUint64: aValue) initialize
]

{ #category : 'accessing' }
GVariant >> getBoolean [

	^ self ffiCall: #(gboolean g_variant_get_boolean (self))
]

{ #category : 'accessing' }
GVariant >> getUint64 [

	^ self ffiCall: #(guint64 g_variant_get_uint64 (self))
]

{ #category : 'accessing' }
GVariant >> unref [

	self ffiCall: #(void g_variant_unref (self))
]
