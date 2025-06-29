"
Define a signal to be installed in a GClass
"
Class {
	#name : 'GClassSignal',
	#superclass : 'Object',
	#instVars : [
		'name',
		'type',
		'signalFlags',
		'classOffset',
		'accumulator',
		'accumulatorData',
		'marshaller',
		'returnType',
		'parameterTypes'
	],
	#pools : [
		'GSignalFlags'
	],
	#category : 'GObject-ClassBuilder',
	#package : 'GObject',
	#tag : 'ClassBuilder'
}

{ #category : 'instance creation' }
GClassSignal class >> on: gType [

	^ self new 
		type: gType;
		yourself
]

{ #category : 'accessing' }
GClassSignal >> accumulator [

	^ accumulator ifNil: [ ExternalAddress null ]
]

{ #category : 'accessing' }
GClassSignal >> accumulator: anObject [

	accumulator := anObject
]

{ #category : 'accessing' }
GClassSignal >> accumulatorData [

	^ accumulatorData ifNil: [ ExternalAddress null ]
]

{ #category : 'accessing' }
GClassSignal >> accumulatorData: anObject [

	accumulatorData := anObject
]

{ #category : 'private' }
GClassSignal >> buildArguments [

	^ { 
		(self name asByteArray copyWith: 0) tfPointerAddress. 
		self type.
		self signalFlags value.
		self classOffset.
		self accumulator.
		self accumulatorData.
		self marshaller.
		self returnType.
		self parameterTypes size.
	}, 
	self parameterTypes
]

{ #category : 'private' }
GClassSignal >> buildSignature [
	"see https://docs.gtk.org/gobject/func.signal_new.html"
	| args |

	args := #(gchar* signal_name,
  		"GType"gsize itype,
  		GSignalFlags signal_flags,
  		guint class_offset,
  		"GSignalAccumulator"void *accumulator,
  		gpointer accu_data,
  		"GSignalCMarshaller"void *c_marshaller,
  		"GType"gsize return_type,
  		guint n_params).
  		
  	self parameterTypes ifNotEmpty: [ :params |
  		| paramsArray index |
  		index := 0.
  		paramsArray := Array streamContents: [ :stream |
  			params 
  				do: [ :each | 
  					index := index + 1.
  					stream nextPut: #gsize.
  					stream nextPut: ('param', index asString) asSymbol ]
  				separatedBy: [ 
  					stream nextPut: #, ] ].
  		args := args copyWith: #,.
  		args := args copyWithAll: paramsArray ].
  		
  	^ { #guint. args }
]

{ #category : 'accessing' }
GClassSignal >> classOffset [

	^ classOffset ifNil: [ 0 ]
]

{ #category : 'accessing' }
GClassSignal >> classOffset: anObject [

	classOffset := anObject
]

{ #category : 'executing' }
GClassSignal >> execute [

	"see https://docs.gtk.org/gobject/func.signal_new.html"
	^ (GExternalFunction
		newName: 'g_signal_new' 
		signature: self buildSignature
		library: GObjectLibrary uniqueInstance)
		beVariadicWithFixedArgumentCount: 9;
		invokeWithArguments: self buildArguments
]

{ #category : 'accessing' }
GClassSignal >> marshaller [

	^ marshaller ifNil: [ ExternalAddress null ]
]

{ #category : 'accessing' }
GClassSignal >> marshaller: anObject [

	marshaller := anObject
]

{ #category : 'accessing' }
GClassSignal >> name [

	^ name
]

{ #category : 'accessing' }
GClassSignal >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
GClassSignal >> parameterTypes [

	^ parameterTypes ifNil: [ #() ]
]

{ #category : 'accessing' }
GClassSignal >> parameterTypes: anObject [

	parameterTypes := anObject
]

{ #category : 'accessing' }
GClassSignal >> returnType [

	^ returnType
]

{ #category : 'accessing' }
GClassSignal >> returnType: anObject [

	returnType := anObject
]

{ #category : 'accessing' }
GClassSignal >> signalFlags [

	^ signalFlags ifNil: [ signalFlags := G_SIGNAL_RUN_LAST ]
]

{ #category : 'accessing' }
GClassSignal >> signalFlags: anObject [

	signalFlags := anObject
]

{ #category : 'accessing' }
GClassSignal >> type [

	^ type
]

{ #category : 'accessing' }
GClassSignal >> type: anObject [

	type := anObject
]
