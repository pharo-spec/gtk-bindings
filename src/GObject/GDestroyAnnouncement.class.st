"
I signal a gobject has been destroyed.
"
Class {
	#name : 'GDestroyAnnouncement',
	#superclass : 'GSignalBaseAnnouncement',
	#instVars : [
		'handle'
	],
	#classVars : [
		'NotifyCallback'
	],
	#category : 'GObject-Signal',
	#package : 'GObject',
	#tag : 'Signal'
}

{ #category : 'installing' }
GDestroyAnnouncement class >> installFor: aWidget [
	
	self isFiltered ifTrue: [ ^ self ].
	aWidget weakRef: self notifyCallback
]

{ #category : 'private' }
GDestroyAnnouncement class >> notifyCallback [

	^ NotifyCallback ifNil: [ 
		NotifyCallback := GCallback 
			signature: #(void (void *data, void *object)) 
			block: [ :data :object | 
				self new 
					 handle: object;
					 emit ] ]
]

{ #category : 'initialization' }
GDestroyAnnouncement class >> reset [ 
	<script>
	
	NotifyCallback := nil
]

{ #category : 'accessing' }
GDestroyAnnouncement >> handle [
	^ handle
]

{ #category : 'accessing' }
GDestroyAnnouncement >> handle: anObject [
	handle := anObject
]

{ #category : 'logging' }
GDestroyAnnouncement >> logIn: aLogger [

	^ aLogger logDestroySignal: self
]

{ #category : 'printing' }
GDestroyAnnouncement >> printOneLineContentsOn: stream [
	
	stream << self handle printString
]
