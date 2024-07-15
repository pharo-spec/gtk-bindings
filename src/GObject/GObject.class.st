"
I'm a base for all Gtk3 objects (not all Gtk3 references are).
"
Class {
	#name : 'GObject',
	#superclass : 'GBaseObject',
	#instVars : [
		'callbacks'
	],
	#pools : [
		'GConnectFlags',
		'GSignalMatchType'
	],
	#category : 'GObject-Base',
	#package : 'GObject',
	#tag : 'Base'
}

{ #category : 'private' }
GObject class >> finalize: handle [
	
	self objectUnref: handle
]

{ #category : 'finalization' }
GObject class >> finalizeResourceData: handle [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	self flag: #REMOVEME.
	self error: 'Should not arrive here.'
]

{ #category : 'accessing' }
GObject class >> gClass [

	^ self gTypeClass
]

{ #category : 'accessing' }
GObject class >> gClassSize [
	"hardcoded. I took the size by executing sizeof in a C program"

	^ 136
]

{ #category : 'class initialization' }
GObject class >> gDefine: aClass [
	"To be called by the new method of pharo classes who extent gtk classes"
]

{ #category : 'factory' }
GObject class >> gObjectNew: object_type [

	^ self ffiCall: #(void *g_object_new (gsize object_type, NULL))
]

{ #category : 'factory' }
GObject class >> gObjectNew: object_type propertyName: aName integerValue: aNumber [
	
	^ self 
		ffiCall: #(void *g_object_new (
			gsize object_type, 
			String aName, 
			gint aNumber,
			NULL))
		module: GObjectLibrary
]

{ #category : 'accessing' }
GObject class >> gSize [

	^ 24
]

{ #category : 'accessing' }
GObject class >> gType [
	"answers the GType of a Gtk class. 
	 This methiod needs to be override in all my subclasses (see #generateGTypeMethods)
	 WARNING: While the type is named GType, we have a collision with the GType shared pool, 
	 that's why we use its mapped type: gsize"

	^ self ffiCall: #(gsize g_object_get_type()) module: GObjectLibrary 
]

{ #category : 'accessing' }
GObject class >> gTypeClass [
	| gType handle |

	gType := self gType.
	handle := self gTypeClassPeek: gType.
	handle isNull ifTrue: [ ^ self gTypeClassRef: gType ].
	
	^ handle
]

{ #category : 'private' }
GObject class >> gTypeClassPeek: type [

	self ffiCall: #(gpointer g_type_class_peek (gsize type))
]

{ #category : 'private' }
GObject class >> gTypeClassRef: type [

	self ffiCall: #(gpointer g_type_class_ref (gsize type))
]

{ #category : 'utils' }
GObject class >> generateGTypeMethod [

	(self class selectors includes: #gType) ifTrue: [ ^ self ].
	self class
		compile: ('gType 
	"This method was automatically generated"

	^ self ffiCall: #(gsize {1}_get_type())'
			format: { self gtkPrefix })
		classified: #accessing
]

{ #category : 'utils' }
GObject class >> generateGTypeMethods [
	"you can use this method to generate ALL missing gType methods. 
	 BEWARE: You will be adding incorrect gType methods since the hierarchy here is different than 
	 Gtk hierarchy. Better use #generateGTypeMethod when creating your new class"
	<script>

	self withAllSubclassesDo: [ :each |
		each generateGTypeMethod ]
]

{ #category : 'utils' }
GObject class >> generateInitMethod [

	(self class selectors includes: #gType) ifFalse: [ ^ self ].
	(self class selectors includes: #gInit:) ifTrue: [ ^ self ].
	
	self class
		compile: ('gInit: object 
	"This method was automatically generated"

	^ self ffiCall: #(void {1}_init(void *object))'
			format: { self gtkPrefix })
		classified: #accessing
]

{ #category : 'utils' }
GObject class >> generateInitMethods [
	<script>

	self withAllSubclassesDo: [ :each |
		each generateInitMethod ]
]

{ #category : 'utils' }
GObject class >> gtkPrefix [
		
	^ String streamContents: [ :stream |
		(self name normalizeCamelCase) substrings
			do: [ :each | stream << (each asLowercase) ]
			separatedBy: [ stream << '_' ] ]
]

{ #category : 'private' }
GObject class >> instance: handle isFundamentallyA: fundamental_type [

	^ self 
		ffiCall: #(gboolean g_type_check_instance_is_fundamentally_a (
			void *handle,
			gsize fundamental_type))
		module: GObjectLibrary
]

{ #category : 'private' }
GObject class >> instanceIsObject: handle [
		
	^ GRunLoop defer: [ 
		self instance: handle isFundamentallyA: G_TYPE_OBJECT ]
]

{ #category : 'private' }
GObject class >> objectUnref: handle [
	
	^ self ffiCall: #(void g_object_unref (void *handle)) module: GObjectLibrary
]

{ #category : 'private' }
GObject class >> referenceCountOf: handle [

	self flag: #HACK. "I do not have a clean way to access ref_count, but Since I know 
the structure of a GObject, I know where ref_count field is stored. I will access it 
directly.
 From gobject.h: 
/**
 * GObject:
 * 
 * All the fields in the GObject structure are private 
 * to the #GObject implementation and should never be accessed directly.
 */
struct  _GObject
{
  GTypeInstance  g_type_instance;
  
  /*< private >*/
  volatile guint ref_count;
  GData         *qdata;
};"
	
	^ handle unsignedLongAt: (self resolveType: 'gsize') externalTypeSize + 1
]

{ #category : 'private' }
GObject class >> resolveType: aType [

	^ FFICallout new 
		requestor: self class; 
		resolveType: aType
]

{ #category : 'initialization' }
GObject >> autoObjectUnref [
	"by default, gobjects will be marked for autorelease, to ensure we do not leak them.
	 but some special kind of gobjects (like gtkwidgets) may want to override this and cancel 
	 the autorelease mechanism."
	
	self autoRelease
]

{ #category : 'accessing - referencing' }
GObject >> autoReleaseWhenDisposedByGtk [

	GEngine current registerObjectDispose: self
]

{ #category : 'private - signaling' }
GObject >> basicConnectSignal: callback [
	| id |
	
	self registerCallback: callback.
	id := self 
		signal: callback signalName
		connect: callback 
		data: callback thunk.
	callback registerId: id
]

{ #category : 'signaling' }
GObject >> blockCallback: aString during: aBlock [

	^ self 
		blockCallbacks: { aString } 
		during: aBlock
]

{ #category : 'signaling' }
GObject >> blockCallbacks: aCollection during: aBlock [
	| matching |

	callbacks isEmptyOrNil ifTrue: [ 
		aBlock value.
		^ self ].
	
	matching := callbacks select: [ :each | aCollection includes: each signalName ].
	"disconnect"
	matching do: [ :each | self gSignalHandlerBlock: each registerId ].
	aBlock ensure: [
		"connect again"
		matching do: [ :each |
			self gSignalHandlerUnblock: each registerId ] ]
]

{ #category : 'accessing' }
GObject >> callbacks [

	^ callbacks
]

{ #category : 'signaling' }
GObject >> connect: aString do: aBlock [
	"this is the basic signaling (for IO events), who share signature along them... of course 
	 this is not correct in all cases (like for example 'draw'), then you need to use the method
	 #connect:signature:do:
	 BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"

	^ self 
		connect: aString 
		signature: #(void (void *widget, void *aData))  
 		do: [ :widget :aData | aBlock value ]
]

{ #category : 'signaling' }
GObject >> connect: aString signature: signature do: aBlock [
	"BEWARE when installing callbacks to gtk... you HAVE TO catch and fork any error happening, 
	 otherwise you will crash your image (event processing happens in VM event loop, so is fragile)"

	self connectSignal: (GGenericSignalCallback
		signal: aString 
		signature: signature 
		block: aBlock)
]

{ #category : 'private - signaling' }
GObject >> connectSignal: callback [

	self 
		detectCallbackBySignal: callback signalName
		ifFound:  [ :aCallback | aCallback link: callback ]
		ifNone: [ self basicConnectSignal: callback ]. 
	
	GConnectSignalAnnouncement emitWidget: self signal: callback signalName.
	
	^ callback
]

{ #category : 'accessing' }
GObject >> dataAt: key [

	self 
		ffiCall: #(gpointer g_object_get_data (self, const gchar* key))
		module: GObjectLibrary
]

{ #category : 'accessing' }
GObject >> dataAt: key put: data [

	self 
		ffiCall: #(void g_object_set_data ( self, const gchar* key, gpointer data))
		module: GObjectLibrary
]

{ #category : 'private' }
GObject >> detectCallbackBySignal: aName ifFound: foundBlock ifNone: noneBlock [

	callbacks ifNil: [ ^ noneBlock value ].
	^ callbacks 
		detect: [ :each | each signalName = aName ]
		ifFound: foundBlock
		ifNone: noneBlock
]

{ #category : 'signaling' }
GObject >> disconnect: aString [

	callbacks isEmptyOrNil ifTrue: [ ^ self ].
	"Do not use #select:thenDo: because I want explicitly the new collection 
	 (because disconnect will remove the callback from the list)"
	(callbacks
		select: [ :each | each signalName = aString ])
		do: [ :each | self disconnectCallback: each ]
]

{ #category : 'signaling' }
GObject >> disconnect: aString during: aBlock [

	self 
		disconnectAll: { aString } 
		during: aBlock
]

{ #category : 'signaling' }
GObject >> disconnectAll [

	callbacks isEmptyOrNil ifTrue: [ ^ self ].
	callbacks copy 
		do: [ :each | self disconnectCallback: each ]
]

{ #category : 'signaling' }
GObject >> disconnectAll: aCollection during: aBlock [
	| matching |

	callbacks isEmptyOrNil ifTrue: [ 
		aBlock value.
		^ self ].
	
	matching := callbacks select: [ :each | aCollection includes: each signalName ].
	"disconnect"
	matching do: [ :each | self disconnectCallback: each ].
	aBlock ensure: [
		"connect again"
		matching do: [ :each |
			self connectSignal: each ] ]
]

{ #category : 'private - signaling' }
GObject >> disconnectByData: pointerToData [

	^ self 
		disconnectMatchedMask: G_SIGNAL_MATCH_DATA 
		signal: 0
		detail: 0 
		closure: ExternalAddress null
		func:  ExternalAddress null 
		data: pointerToData
]

{ #category : 'private - signaling' }
GObject >> disconnectByFunc: pointerToFunc [

	^ self 
		disconnectMatchedMask: G_SIGNAL_MATCH_DATA 
		signal: 0
		detail: 0 
		closure: ExternalAddress null
		func:  pointerToFunc
		data: ExternalAddress null
]

{ #category : 'private - signaling' }
GObject >> disconnectById: anId [

	^ self 
		disconnectMatchedMask: G_SIGNAL_MATCH_ID 
		signal: anId
		detail: 0 
		closure: ExternalAddress null
		func:  ExternalAddress null 
		data: ExternalAddress null
]

{ #category : 'private - signaling' }
GObject >> disconnectCallback: aCallback [
	| numberDiconnected |

	"#disconnectById: does not seems t be working, I will do it by data (and passing the pointer 
	 to the thunk as data in callback registrtation). 
	 WARNING: Also I cannot use #disconnectByFunc: as I was doing it before because the thunk id 
	 not the begining of the callback itself but the entry-point to the callback (in the VM, this 
	 will be wrapped by another function)"
	numberDiconnected := self disconnectByData: aCallback thunk.
	callbacks remove: aCallback.
	GDisconnectCallbackAnnouncement 
		emitCallback: aCallback 
		number: numberDiconnected.
		
	^ numberDiconnected
]

{ #category : 'private - signaling' }
GObject >> disconnectMatchedMask: mask 
	signal: signal_id 
	detail: detail 
	closure: closure 
	func: func 
	data: aData [

	^ self ffiCall: #(guint g_signal_handlers_disconnect_matched (
		self,
		GSignalMatchType mask,
		guint signal_id,
		GQuark detail,
		"GClosure *" void *closure,
		"FFICallback " void *func,
      gpointer aData)) module: GObjectLibrary
]

{ #category : 'signaling' }
GObject >> emitSignalByName: detailed_signal [
	| handledBuffer |

	handledBuffer := FFIInt64 newBuffer.
	self 
		emitSignalByName: detailed_signal 
		handled: handledBuffer.
	^ handledBuffer booleanAt: 1
]

{ #category : 'signaling' }
GObject >> emitSignalByName: detailed_signal handled: buffer [
	"buffer is a ByteArray that contains a boolean (int32)"

	self ffiCall: #(void g_signal_emit_by_name (self, const gchar *detailed_signal, void *buffer))
]

{ #category : 'accessing - referencing' }
GObject >> ensureAutoRelease [
	"Verifies if instance is already marked for autoRelease and in case contrary does it.
	 This method DOES NOT increases reference count. 
	 In case you need that, you can see `GObject>>#ensureObjectRefAndAutoRelease`"

	self isMarkedForAutoRelease ifTrue: [ ^ self ].
	self autoRelease
]

{ #category : 'accessing - referencing' }
GObject >> ensureObjectRefAndAutoRelease [
	"If it is already marked for release means the object reference is also already incresed. 
	 We skip that condition to ensure we do not have more 'objectRef' than those we want 
	 (we want just one)
	 This is to be used when replacing layouts and similar approaches. It is needed because 
	 to move a widget from one layout to another I first need to take ownership of the widget:
	 - If I just remove it from old layout it will be collected, and 
	 - I cannot give it to a new layout before removing it first from the older layout.
	 So, what I need to do in those cases is:  
	 ```
		 widgetToMove ensureObjectRefAndAutoRelease.
		 oldLayout remove: widgetToMove.
		 newLayout add: widgetToMove.
	 ```
	 NOTICE: In any other case, seem better to use `GObject>>#autoRelease`"

	self isMarkedForAutoRelease ifTrue: [ ^ self ].
	self objectRef.
	self autoRelease
]

{ #category : 'finalization' }
GObject >> finalize [
	"when marking for autoRelease, g-objects needs to be freed in a particular way."

	self isValidHandle ifFalse: [ ^ self ].
	GRunLoop defer: [ 
		self isObject 
			ifTrue: [ 
				GFinalizeAnnouncement emitTarget: self handle: handle.
				self objectUnref ]
			ifFalse: [
				GZombieAnnouncement emitTarget: self handle: handle ].
		handle beNull ]
]

{ #category : 'finalization' }
GObject >> finalizedOnGtk [
]

{ #category : 'private - primitives' }
GObject >> gFree: aPointer [

	^ self ffiCall: #(void g_free(gpointer aPointer))
]

{ #category : 'private - primitives' }
GObject >> gObjectGet: aName into: aBuffer [

	self 
		ffiCall: #(void g_object_get (self, const gchar *aName, void* aBuffer, NULL)) 
		module: GObjectLibrary
]

{ #category : 'private - primitives' }
GObject >> gObjectGet: aName intoAddress: aBuffer [

	self 
		ffiCall: #(void g_object_get (self, const gchar *aName, gpointer *aBuffer, NULL))
		module: GObjectLibrary
]

{ #category : 'private - primitives' }
GObject >> gObjectGetBoolean: aName [
	"a convenience method to read boolean properties"
	| buffer |
	
	buffer := FFIBool newBuffer.
	self gObjectGet: aName into: buffer.
	^ buffer booleanAt: 1
]

{ #category : 'private - primitives' }
GObject >> gObjectGetDouble: aName [
	"a convenience method to read boolean properties"
	| buffer |
	
	buffer := FFIFloat64 newBuffer.
	self gObjectGet: aName into: buffer.
	^ buffer doubleAt: 1
]

{ #category : 'private - primitives' }
GObject >> gObjectGetHandle: aName [
	| address |
	
	address := ExternalAddress new.
	self gObjectGet: aName intoAddress: address.
	^ address	
			
]

{ #category : 'private - primitives' }
GObject >> gObjectGetHandle: aName as: aClass [
	| address |

	address := self gObjectGetHandle: aName.
	address isNull ifTrue: [ ^ nil ].

	^ aClass fromHandle: address
]

{ #category : 'private - primitives' }
GObject >> gObjectGetInteger: aName [
	"a convenience method to read boolean properties"
	| buffer |
	
	buffer := FFIInt32 newBuffer.
	self gObjectGet: aName into: buffer.
	^ buffer signedLongAt: 1
]

{ #category : 'private - primitives' }
GObject >> gObjectGetLong: aName [
	"a convenience method to read boolean properties"
	| buffer |

	buffer := FFILong newBuffer.
	self gObjectGet: aName into: buffer.
	^ buffer signedLongAt: 1
]

{ #category : 'private - primitives' }
GObject >> gObjectGetString: aName [
	"a convenience method to read string properties"
	| buffer |
	
	buffer := ExternalAddress new.
	self gObjectGet: aName intoAddress: buffer.
	^ buffer utf8StringFromCString
]

{ #category : 'private - primitives' }
GObject >> gObjectSet: aName toBoolean: aBoolean [

	self 
		ffiCall: #(void g_object_set (self, const gchar *aName, gboolean aBoolean, NULL))
		module: GObjectLibrary
]

{ #category : 'private - primitives' }
GObject >> gObjectSet: aName toDouble: aNumber [

	self 
		ffiCall: #(void g_object_set (self, const gchar *aName, gdouble aNumber, NULL))
		module: GObjectLibrary
]

{ #category : 'private - primitives' }
GObject >> gObjectSet: aName toInteger: aNumber [

	self 
		ffiCall: #(void g_object_set (self, const gchar *aName, gint aNumber, NULL))
		module: GObjectLibrary
]

{ #category : 'private - primitives' }
GObject >> gObjectSet: aName toLong: aNumber [

	self
		ffiCall: #(void g_object_set (self, const gchar *aName, glong aNumber, NULL))
		module: GObjectLibrary
]

{ #category : 'private - primitives' }
GObject >> gObjectSet: aName toPointer: aPointer [

	self 
		ffiCall: #(void g_object_set (self, const gchar *aName, gpointer aPointer, NULL))
		module: GObjectLibrary
]

{ #category : 'private - primitives' }
GObject >> gObjectSet: aName toString: aString [

	self 
		ffiCall: #(void g_object_set ( self, const gchar *aName, gchar *aString, NULL))
		module: GObjectLibrary	
]

{ #category : 'private - signaling' }
GObject >> gSignalHandlerBlock: handler_id [

	^ self 
		ffiCall: #(void g_signal_handler_block (self, gulong handler_id)) 
		module: GObjectLibrary
]

{ #category : 'private - signaling' }
GObject >> gSignalHandlerUnblock: handler_id [

	^ self 
		ffiCall: #(void g_signal_handler_unblock (self, gulong handler_id)) 
		module: GObjectLibrary
]

{ #category : 'accessing - type' }
GObject >> gType [

	^ self gTypeClass g_type 
]

{ #category : 'accessing - type' }
GObject >> gTypeClass [
	"This is a hack, but it works :P"
	"first element of any GObject is type instance, and type instanvce is like this: 
		struct _GTypeInstance
		{
  		/*< private >*/
  		GTypeClass *g_class;
		};
	 so first element is a GTypeClass pointer"
	
	^ GTypeClass fromHandle: (handle pointerAt: 1)
]

{ #category : 'accessing - type' }
GObject >> gTypeName [

	^ self gTypeName: self gType
]

{ #category : 'private - primitives' }
GObject >> gTypeName: type [

	^ self ffiCall: #(gchar *g_type_name (gsize type))
]

{ #category : 'initialization' }
GObject >> initialize [

	super initialize.
	self isValidHandle ifTrue: [ 
		self autoObjectUnref.
		self installDebugSignals	]
]

{ #category : 'private - debugging' }
GObject >> installDebugSignals [
	"emit signals to debug"

	GCreateAnnouncement emitWidget: self.
	GDestroyAnnouncement installFor: self
]

{ #category : 'private' }
GObject >> instanceIsFundamentallyA: fundamental_type [

	self ffiCall: #(gboolean g_type_check_instance_is_fundamentally_a (
		self,
		gsize fundamental_type)) module: GObjectLibrary
]

{ #category : 'testing' }
GObject >> isAlive [
	"Apparently, if #isObject returns true, then the object is still there."

	^ self getHandle isNull not 
		and: [ self isObject 
		and: [ self referenceCount > 0 ] ]
]

{ #category : 'testing' }
GObject >> isFloating [ 

	^ self ffiCall: #(gboolean g_object_is_floating (self))
]

{ #category : 'testing' }
GObject >> isMarkedForAutoRelease [

	^ self resourceManager includesObject: self
]

{ #category : 'testing' }
GObject >> isObject [

	^ self instanceIsFundamentallyA: G_TYPE_OBJECT
]

{ #category : 'accessing - referencing' }
GObject >> notifyDisposed: aBlock [
	| callback |
	
	callback := GCallback 
		signature: #(void (void *data, void *object)) 
		block: [ :data :object | aBlock cull: self ].
	self registerCallback: callback.
	self weakRef: callback
]

{ #category : 'accessing - referencing' }
GObject >> objectRef [

	self ffiCall: #(gpointer g_object_ref (self)) module: GObjectLibrary
]

{ #category : 'accessing - referencing' }
GObject >> objectRefSink [

	self ffiCall: #(gpointer g_object_ref_sink (self))
]

{ #category : 'accessing - referencing' }
GObject >> objectUnref [

	self ffiCall: #(void g_object_unref (self)) module: GObjectLibrary
]

{ #category : 'accessing - referencing' }
GObject >> objectUnrefNow [
	"Ensure this is not autoreleased and instead is unref right now"

	self doNotAutoRelease.
	self objectUnref
]

{ #category : 'private - debugging' }
GObject >> referenceCount [
	"Access the reference count of this object."

	^ self class referenceCountOf: self getHandle
]

{ #category : 'private' }
GObject >> registerCallback: aCallback [

	callbacks ifNil: [ callbacks := Set new ].
	callbacks add: aCallback.
	"Stdio stdout << aCallback thunk printString << ':' << aCallback tfPrintString; lf"
]

{ #category : 'private - signaling' }
GObject >> signal: aString connect: callback data: aData [

	^ self 
		signal: aString  
		connect: callback 
		data: aData
		flags: G_CONNECT_NONE
]

{ #category : 'private - signaling' }
GObject >> signal: signalName connect: callback data: aData flags: connectFlags [

	^ self 
		ffiCall: #( gulong g_signal_connect_data ( 
			self,
			const gchar *signalName,
			GCallback callback,
			gpointer 	aData,
			NULL,
			GConnectFlags connectFlags ) ) 
		module: GObjectLibrary
]

{ #category : 'private - signaling' }
GObject >> signal: signalName connect: callback data: aData flags: connectFlags variable: variable [
	
	^ self ffiCall: #( gulong g_signal_connect_data ( 
		self,
		const gchar *signalName,
		GCallback callback,
		gpointer 	aData,
		uint64 variable,
		uint64 connectFlags ) ) module: GObjectLibrary
]

{ #category : 'accessing - referencing' }
GObject >> weakRef: notify [ 

	^ self 
		ffiCall: #(void g_object_weak_ref (self, GCallback notify, NULL)) 
		module: GObjectLibrary
]

{ #category : 'accessing - referencing' }
GObject >> weakRef: notify data: data [

	^ self 
		ffiCall: #(void g_object_weak_ref (self, GCallback notify, gpointer data)) 
		module: GObjectLibrary
]

{ #category : 'accessing' }
GObject >> withCallbacksMatching: matchBlock do: aBlock [

	self callbacks 
		select: matchBlock
		thenDo: aBlock
]

{ #category : 'accessing' }
GObject >> withCallbacksOfType: aClass do: aBlock [

	self
		withCallbacksMatching: [ :each | each class = aClass ]
		do: aBlock
]

{ #category : 'accessing - referencing' }
GObject >> withObjectReferenceDo: aBlock [
	"takes a reference to execute an operation and then releases it (this is to ensure 
	 an object is not collected while I am doing something with it"
	
	self objectRef.
	aBlock ensure: [ 
		self objectUnref ]
]
