Class {
	#name : #GIOChannelBinaryFileStream,
	#superclass : #BinaryFileStream,
	#instVars : [
		'channel'
	],
	#category : #'GLib-IO'
}

{ #category : #'instance creation' }
GIOChannelBinaryFileStream class >> connectChannel: aChannel forWrite: aBoolean [

	^ self basicNew
		connectChannel: aChannel forWrite: aBoolean;
		yourself
]

{ #category : #'as yet unclassified' }
GIOChannelBinaryFileStream class >> connectFileDescriptor: fd forWrite: aBoolean [

	^ self 
		connectChannel: (GIOChannel newFromFileDescriptor: fd)
		forWrite: aBoolean
]

{ #category : #'instance creation' }
GIOChannelBinaryFileStream >> connectChannel: aChannel forWrite: aBoolean [

	channel := aChannel.
	forWrite := aBoolean.
	
	semaphore := Semaphore new.
	channel watch: [ :theChannel :theCondition :user_data | 
		semaphore signal.
		true ]
]

{ #category : #initialization }
GIOChannelBinaryFileStream >> initialize [

	super initialize.
	semaphore := Semaphore new.
]

{ #category : #reading }
GIOChannelBinaryFileStream >> next: n into: aBuffer [
	"Return a string with the next n characters of the filestream in it."
	| readBuffer read error status |
	
	semaphore wait.
	
	error := GError new.
	readBuffer := FFISizeT newBuffer.
	status := channel readChars: aBuffer count: n bytesRead: readBuffer error: error.
	status = GIOStatus G_IO_STATUS_ERROR
		ifTrue: [ self error: error messageString ].
	read := readBuffer signedLongAt: 1.
	^ read = n 
		ifTrue: [ aBuffer ]
		ifFalse: [ aBuffer copyFrom: 1 to: read ]
]

{ #category : #writing }
GIOChannelBinaryFileStream >> next: amount putAll: aByteArray [
	| bytesWritten status error |
	
	forWrite ifFalse: [ ^ self error: 'Cannot write a read-only file' ].

	error := GError new.	
	bytesWritten := FFISizeT newBuffer.

	status := channel 
		writeChars: aByteArray 
		count: amount 
		bytesWritten: bytesWritten
		error: error.
	
	^ aByteArray
]
