"
GValue 

https://developer.gnome.org/gobject/stable/gobject-Generic-values.html#GValue
"
Class {
	#name : 'GValue',
	#superclass : 'GStructure',
	#traits : 'GObjectTLibrary',
	#classTraits : 'GObjectTLibrary classTrait',
	#classVars : [
		'OFFSET_DATA_1',
		'OFFSET_DATA_2',
		'OFFSET_G_TYPE'
	],
	#pools : [
		'GType'
	],
	#category : 'GObject-Misc',
	#package : 'GObject',
	#tag : 'Misc'
}

{ #category : 'field definition' }
GValue class >> fieldsDesc [
	"self rebuildFieldAccessors"

	^ #( 
	GType g_type;
	"this is an union, in fact, but we don't care as is opaque"
	gpointer data_1;
	gpointer data_2;	
	 )
]

{ #category : 'instance creation' }
GValue class >> newString [

	^ self new initString
]

{ #category : 'accessing - structure variables' }
GValue >> data_1 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA_1) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GValue >> data_1: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA_1 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GValue >> data_2 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DATA_2) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
GValue >> data_2: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DATA_2 put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
GValue >> g_type [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_G_TYPE
]

{ #category : 'accessing - structure variables' }
GValue >> g_type: anObject [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_G_TYPE put: anObject
]

{ #category : 'accessing' }
GValue >> getBoolean [ 

	^ self ffiCall: #(gboolean g_value_get_boolean (self))
]

{ #category : 'accessing' }
GValue >> getFloat [

	^ self ffiCall: #(gfloat g_value_get_float (self))
]

{ #category : 'accessing' }
GValue >> getInt [ 

	^ self ffiCall: #(int g_value_get_int (self))
]

{ #category : 'accessing' }
GValue >> getLong [

	^ self ffiCall: #(long g_value_get_long (self))
]

{ #category : 'accessing' }
GValue >> getObject [

	^ self ffiCall: #(gpointer g_value_get_object (self))
]

{ #category : 'accessing' }
GValue >> getString [

	^ self ffiCall: #(gchar* g_value_get_string  (self))
]

{ #category : 'initialization' }
GValue >> init: g_type [

	self ffiCall: #(void *g_value_init (self, gsize g_type))
]

{ #category : 'initialization' }
GValue >> initString [

	self init: G_TYPE_STRING
]

{ #category : 'accessing' }
GValue >> setBoolean: v_boolean [ 

	^ self ffiCall: #(void g_value_set_boolean (self, gboolean v_boolean))
]

{ #category : 'accessing' }
GValue >> setDouble: v_double [

	self ffiCall: #(void g_value_set_double (self, gdouble v_double))
]

{ #category : 'accessing' }
GValue >> setFloat: v_float [

	self ffiCall: #(void g_value_set_float (self, gfloat v_float))
]

{ #category : 'accessing' }
GValue >> setInt64: v_int64 [

	self ffiCall: #(void g_value_set_int64 (self, gint64 v_int64))
]

{ #category : 'accessing' }
GValue >> setInt: v_int [

	self ffiCall: #(void g_value_set_int (self, gint v_int))
]

{ #category : 'accessing' }
GValue >> setLong: v_long [

	self ffiCall: #(void g_value_set_long (self, glong v_long))
]

{ #category : 'accessing' }
GValue >> setObject: v_object [ 

	^ self ffiCall: #(void g_value_set_object (self, gpointer v_object))
]

{ #category : 'accessing' }
GValue >> setPointer: v_pointer [

	self ffiCall: #(void g_value_set_pointer (self, gpointer v_pointer))
]

{ #category : 'accessing' }
GValue >> setSChar: v_char [

	self ffiCall: #(void g_value_set_schar (self, gint8 v_char))
]

{ #category : 'accessing' }
GValue >> setString: v_string [

	self ffiCall: #(void g_value_set_string (self, const gchar *v_string))
]

{ #category : 'accessing' }
GValue >> setUChar: u_char [

	self ffiCall: #(void g_value_set_uchar (self, guchar u_char))
]

{ #category : 'accessing' }
GValue >> setUInt64: v_uint64 [

	self ffiCall: #(void g_value_set_uint64 (self, guint64 v_uint64))
]

{ #category : 'accessing' }
GValue >> setUInt: u_int [

	self ffiCall: #(void g_value_set_uint (self, guint u_int))
]

{ #category : 'accessing' }
GValue >> setULong: u_long [

	self ffiCall: #(void g_value_set_ulong (self, gulong u_long))
]

{ #category : 'accessing' }
GValue >> unset [

	self ffiCall: #(void g_value_unset (self))
]
