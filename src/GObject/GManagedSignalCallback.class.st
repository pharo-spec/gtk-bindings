Class {
	#name : 'GManagedSignalCallback',
	#superclass : 'GSignalCallback',
	#pools : [
		'GObjectTypes'
	],
	#category : 'GObject-Callbacks',
	#package : 'GObject',
	#tag : 'Callbacks'
}

{ #category : 'instance creation' }
GManagedSignalCallback class >> do: aBlock [

	^ self new do: aBlock
]

{ #category : 'connecting' }
GManagedSignalCallback >> connectTo: aWidget [

	aWidget connectSignal: self
]

{ #category : 'connecting' }
GManagedSignalCallback >> disconnectFrom: aWidget [

	aWidget disconnectCallback: self	
]

{ #category : 'accessing' }
GManagedSignalCallback >> do: aBlock [

	self 
		signature: self signature 
		block: aBlock
]

{ #category : 'accessing' }
GManagedSignalCallback >> signature [

	^ #(void (void *widget, void *data))
]
